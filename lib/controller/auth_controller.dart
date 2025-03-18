// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:serviceapp/view/pages/home/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  User? get currentUser => _auth.currentUser;

  String? _errorMessage;
  User? _user;
  bool showOtpField = false;
  String? verificationId;

  String? get errorMessage => _errorMessage;

  User? get user => _user;

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final result = await _auth.signInWithCredential(credential);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('userId', result.user!.uid);

      notifyListeners();
      return result.user;
    } catch (e) {
      return null;
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('userId');
  }

  Future<bool> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? hotelId = prefs.getString('userId');

    return _auth.currentUser != null && hotelId != null;
  }

  void sendOTP(BuildContext context, TextEditingController phoneNumbers) async {
    if (phoneNumbers.text.isEmpty ||
        !RegExp(r'^[0-9]{10}$').hasMatch(phoneNumbers.text.trim())) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Please enter a valid 10-digit phone number")),
      );
      return;
    }

    String phoneNumber = '+91${phoneNumbers.text.trim()}';
    log("Sending OTP to: $phoneNumber");

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          try {
            await _auth.signInWithCredential(credential);
            _user = _auth.currentUser;

            Future.microtask(() {
              notifyListeners();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Auto verification successful!")),
              );
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            });
          } catch (e) {
            log("Auto verification error: $e");
            Future.microtask(() {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Auto verification failed: $e")),
              );
            });
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          log("Verification Failed: ${e.message}");
          Future.microtask(() {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Verification failed: ${e.message}")),
            );
          });
        },
        codeSent: (String verificationId, int? resendToken) {
          log("OTP Sent to $phoneNumber");
          this.verificationId = verificationId;
          showOtpField = true;

          Future.microtask(() {
            notifyListeners();
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          log("Auto retrieval timeout");
        },
      );
    } catch (e) {
      log("Error sending OTP: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  // ----------- Verify OTP ---------------
  Future<void> verifyOTP(
      BuildContext context, TextEditingController otpController) async {
    try {
      if (verificationId == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("No OTP request found.")),
        );
        return;
      }

      String otp = otpController.text.trim();
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId!,
        smsCode: otp,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      _user = _auth.currentUser;
      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("OTP Verified Successfully!")),
      );
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } on FirebaseAuthException catch (e) {
      log("OTP Verification Failed: ${e.message}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("OTP Verification Failed: ${e.message}")),
      );
    }
  }
}
