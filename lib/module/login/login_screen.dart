import 'package:flutter/material.dart';

import '../../source/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              gradient: primaryGradient,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/desk-bell.png',
                  width: 100,
                  height: 100,
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Welcome, Guest',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 62.0),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: const TextStyle(
                              fontFamily: 'Montserrat',
                            ),
                            errorStyle: const TextStyle(
                                color: Colors.red
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(90),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(90),
                              borderSide: const BorderSide(color: Colors.transparent, width: 1.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(90),
                              borderSide: const BorderSide(color: Colors.black, width: 2),
                            ),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.5),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                          ),
                          validator: (email) {
                            if (email == null || email.isEmpty) {
                              return 'Please enter your email';
                            }
                            // Define email pattern using RegExp
                            final emailRegExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                            if (!emailRegExp.hasMatch(email)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 36.0),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: obscurePassword,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: const TextStyle(
                              fontFamily: 'Montserrat',
                            ),
                            errorStyle: const TextStyle(
                                color: Colors.red
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(90),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(90),
                              borderSide: const BorderSide(color: Colors.transparent, width: 1.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(90),
                              borderSide: const BorderSide(color: Colors.black, width: 2),
                            ),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.5),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                            suffixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      obscurePassword = !obscurePassword;
                                    });
                                  },
                                  child: Icon(
                                    obscurePassword ? Icons.visibility_outlined : Icons
                                        .visibility_off_outlined,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          validator: (password) {
                            if (password == null || password.isEmpty) {
                              return 'Please enter your password';
                            }
                            // Define password pattern with max 16 characters
                            final passwordRegExp = RegExp(r'^(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,16}$');
                            if (!passwordRegExp.hasMatch(password)) {
                              return 'Password must be 8-16 characters, include 1 capital letter and 1 number';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              splashFactory: NoSplash.splashFactory,
                            ),
                            child: const Text(
                              'Forgot password?',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                decoration: TextDecoration.underline
                              )
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 36.0),

                    ],
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
