import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serviceapp/controller/auth_controller.dart';
import 'package:serviceapp/view/pages/home/home_page.dart';
import 'package:serviceapp/view/auth/phone_auth.dart';
import 'package:serviceapp/view/widgets/bottom_navbar.dart';
import 'package:serviceapp/view/widgets/button.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 50,
              width: 50,
              color: Colors.green,
            ),
            SizedBox(
              child: Column(
                children: [
                  CustomButton(
                    icon: Icons.abc,
                    text: "Continue With Google",
                    onTap: () async {
                      final user = await authService.signInWithGoogle();
                      if (user != null) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TestPageBottom()),
                        );
                      }
                    },
                    color: Colors.grey[200]!,
                    textColor: Colors.black,
                    borderRadius: 12.0,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    height: 60,
                    width: 350,
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    text: "Phone",
                    onTap: () async {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPagePhoneAuth()),
                      );
                    },
                    color: Colors.green,
                    textColor: Colors.white,
                    borderRadius: 12.0,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    height: 60,
                    width: 350,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
