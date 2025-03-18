import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serviceapp/controller/auth_controller.dart';
import 'package:serviceapp/view/auth/auth.dart';
import 'package:serviceapp/view/widgets/bottom_navbar.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.microtask(() async {
      bool isLoggedIn = await Provider.of<AuthService>(context, listen: false)
          .checkLoginStatus();

      if (isLoggedIn) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => TestPageBottom()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const AuthenticationScreen()),
        );
      }
    });

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
