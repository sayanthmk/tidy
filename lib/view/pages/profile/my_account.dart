import 'package:flutter/material.dart';
import 'package:serviceapp/constants/color.dart';
import 'package:serviceapp/controller/auth_controller.dart';
import 'package:serviceapp/view/auth/auth.dart';
import 'package:serviceapp/view/pages/profile/menuitems.dart';
import 'package:serviceapp/view/widgets/alert_dialog.dart';

class AccountProfilePage extends StatelessWidget {
  const AccountProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService auth = AuthService();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Account',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      // color: TidyColors.,
                      gradient: TidyColors.primarybuttongradient,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        'FE',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Fathima Ebrahim',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '+91 908 786 4233',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Wallet',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      height: 35,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            'Balance - 125',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.green),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              MenuItem(
                icon: Icons.person_pin,
                title: "Settings",
                onTap: () {},
              ),
              MenuItem(
                icon: Icons.location_on,
                title: "Saved Address",
                onTap: () {},
              ),
              MenuItem(
                icon: Icons.note_alt,
                title: "Terms & Conditions",
                onTap: () {},
              ),
              MenuItem(
                icon: Icons.note_alt,
                title: "Privacy Policy",
                onTap: () {},
              ),
              MenuItem(
                icon: Icons.people_alt_sharp,
                title: "Refer a friend",
                onTap: () {},
              ),
              MenuItem(
                icon: Icons.phone,
                title: "Customer Support",
                onTap: () {},
              ),
              MenuItem(
                icon: Icons.logout,
                title: "Log Out",
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => CustomAlertDialog(
                      titleText: 'Logout',
                      contentText: 'Are you sure you want to Logout?',
                      buttonText1: 'Cancel',
                      buttonText2: 'Logout',
                      onPressButton1: () {
                        Navigator.of(context).pop();
                      },
                      onPressButton2: () async {
                        auth.signOut();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const AuthenticationScreen(),
                        ));
                      },
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
