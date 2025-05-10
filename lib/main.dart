import 'package:flutter/material.dart';
import 'package:hotel_management/source/colors.dart';
import 'module/login/login_screen.dart';

void main() {
  runApp(const HotelApp());
}

class HotelApp extends StatelessWidget {
  const HotelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: primaryGradient,
          ),
          child: const LoginScreen(),
        ),
      ),
    );
  }
}