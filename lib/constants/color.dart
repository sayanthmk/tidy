import 'package:flutter/material.dart';

class TidyColors {
  static const LinearGradient primarybuttongradient = LinearGradient(
    colors: [
      Color.fromRGBO(95, 205, 112, 1),
      Color.fromRGBO(14, 130, 107, 1),
    ],
    stops: [0.0, 0.5],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Color profilesecondaryColor = Color(0xFFF5F9FF);
  static const Color lightgreen = Color(0xFFF5F9FF);
  static const Color buttonOrange = Color.fromARGB(255, 255, 87, 34);
}
