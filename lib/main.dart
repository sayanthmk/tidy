import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serviceapp/controller/auth_controller.dart';
import 'package:serviceapp/controller/bottm_nav_controller.dart';
import 'package:serviceapp/controller/cart_items_controller.dart';
import 'package:serviceapp/firebase_options.dart';
import 'package:serviceapp/view/auth/phone_auth.dart';
import 'package:serviceapp/view/pages/clean_service.dart/cleaning_services.dart';
import 'package:serviceapp/view/widgets/bottom_navbar.dart';
import 'package:serviceapp/unused/car.dart';
import 'package:serviceapp/view/widgets/phone_auth.dart';
import 'package:serviceapp/view/widgets/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => ServiceItemProvider()),
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const TestPageBottom(),
      ),
    );
  }
}
