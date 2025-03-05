import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:serviceapp/view/home/home.dart';
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
    String? hotelId = prefs.getString('hotelId');

    return _auth.currentUser != null && hotelId != null;
  }

  void sendOTP(BuildContext context, TextEditingController phoneNumbers) async {
    String phoneNumber = '+91${phoneNumbers.text.trim()}';
    log("Sending OTP to: $phoneNumber");

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          log("Auto verification completed");
          await _auth.signInWithCredential(credential);
          _user = _auth.currentUser;
          notifyListeners();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Auto verification successful!")),
          );
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
        },
        verificationFailed: (FirebaseAuthException e) {
          log("Verification Failed: ${e.message}");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Verification failed: ${e.message}")),
          );
        },
        codeSent: (String verificationId, int? resendToken) {
          log("OTP Sent to $phoneNumber");
          this.verificationId = verificationId;
          showOtpField = true;
          notifyListeners();
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
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } on FirebaseAuthException catch (e) {
      log("OTP Verification Failed: ${e.message}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("OTP Verification Failed: ${e.message}")),
      );
    }
  }
}




 // Stream<User?> get user => _auth.authStateChanges();
  // User? _newuser;
  // User? get newuser => _newuser;

  // Future<User?> signInWithEmailAndPassword(
  //     String email, String password) async {
  //   try {
  //     final result = await _auth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //     notifyListeners();
  //     return result.user;
  //   } catch (e) {
  //     return null;
  //   }
  // }

  // Future<User?> createUserWithEmailAndPassword(
  //     String email, String password) async {
  //   try {
  //     final result = await _auth.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //     notifyListeners();
  //     return result.user;
  //   } catch (e) {
  //     return null;
  //   }
  // }
    // Future<void> signInWithPhone(
  //     String phoneNumber,
  //     Function(PhoneAuthCredential) verificationCompleted,
  //     Function(FirebaseAuthException) verificationFailed,
  //     Function(String, int?) codeSent,
  //     Function(String) codeAutoRetrievalTimeout) async {
  //   await _auth.verifyPhoneNumber(
  //     phoneNumber: phoneNumber,
  //     verificationCompleted: verificationCompleted,
  //     verificationFailed: verificationFailed,
  //     codeSent: codeSent,
  //     codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
  //   );
  // }

  // Future<User?> signInWithPhoneCredential(
  //     PhoneAuthCredential credential) async {
  //   try {
  //     final result = await _auth.signInWithCredential(credential);
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     await prefs.setString('userId', result.user!.uid);

  //     notifyListeners();
  //     return result.user;
  //   } catch (e) {
  //     return null;
  //   }
  // }