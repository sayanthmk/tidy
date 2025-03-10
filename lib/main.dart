import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serviceapp/controller/auth_controller.dart';
import 'package:serviceapp/firebase_options.dart';
import 'package:serviceapp/view/auth/auth.dart';
import 'package:serviceapp/view/detail_page/cleaning_services.dart';
import 'package:serviceapp/view/detail_page/my_account.dart';
import 'package:serviceapp/view/detail_page/cart.dart';
import 'package:serviceapp/view/home/hnew.dart';
import 'package:serviceapp/view/home/home.dart';
import 'package:serviceapp/view/widgets/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: AuthenticationScreen(),
      ),
    );
  }
}
