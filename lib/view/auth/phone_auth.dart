import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serviceapp/controller/auth_controller.dart';

class LoginPagePhoneAuth extends StatelessWidget {
  const LoginPagePhoneAuth({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController phoneNumController = TextEditingController();
    final TextEditingController otpController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Consumer<AuthService>(
        builder: (context, authProvider, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              authProvider.showOtpField
                  ? Column(
                      children: [
                        const Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            'Enter OTP',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: otpController,
                          keyboardType: TextInputType.number,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'OTP is required';
                            } else if (value.length != 6) {
                              return 'Please enter a valid 6-digit OTP';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                            onPressed: () {
                              authProvider.verifyOTP(context, otpController);
                            },
                            child: const Text('Get OTP'))
                      ],
                    )
                  : Column(
                      children: [
                        const Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Phone Number',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: phoneNumController,
                          keyboardType: TextInputType.phone,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Phone number is required';
                            } else if (!RegExp(r'^[0-9]{10}$')
                                .hasMatch(value)) {
                              return 'Please enter a valid 10-digit phone number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                            onPressed: () {
                              authProvider.sendOTP(context, phoneNumController);
                            },
                            child: const Text('Get OTP'))
                      ],
                    ),
            ],
          );
        },
      ),
    );
  }
}
