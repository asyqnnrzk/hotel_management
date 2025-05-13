import 'package:flutter/material.dart';
import '../../source/colors.dart';
import 'package:hotel_management/module/home/home_screen.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;
  final bool isDarkMode;

  const LoginScreen({
    super.key,
    required this.onToggleTheme,
    required this.isDarkMode,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _loadLoginInfo(); // Load saved login info if exists
  }

  // Method to load saved login info from SharedPreferences
  Future<void> _loadLoginInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString('email');
    final savedPassword = prefs.getString('password');
    if (savedEmail != null && savedPassword != null) {
      emailController.text = savedEmail;
      passwordController.text = savedPassword;
    }
  }

  // Method to save login info to SharedPreferences
  Future<void> _saveLoginInfo(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('password', password);
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: widget.isDarkMode ? primaryGradientDark : primaryGradientLight,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  widget.isDarkMode ?
                    'assets/images/hotel_logo_dark_transparent.png':
                    'assets/images/hotel_logo_transparent.png',
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Welcome, Manager',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: widget.isDarkMode ? Colors.white : Colors.black,
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
                          style: TextStyle(
                            color: widget.isDarkMode ? Colors.white : Colors.black,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              color: widget.isDarkMode ? Colors.white : Colors.black,
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
                          style: TextStyle(
                            color: widget.isDarkMode ? Colors.white : Colors.black,
                          ),
                          obscureText: obscurePassword,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              color: widget.isDarkMode ? Colors.white : Colors.black,
                            ),
                            errorStyle: const TextStyle(
                              color: Colors.red,
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
                                // Hide password toggle
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      obscurePassword = !obscurePassword;
                                    });
                                  },
                                  child: Icon(
                                    obscurePassword ? Icons.visibility_outlined : Icons
                                        .visibility_off_outlined,
                                    color: widget.isDarkMode ? Colors.white : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          validator: (password) {
                            if (password == null || password.isEmpty) {
                              return 'Please enter your password';
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
                            child: InkWell(
                              onTap: () {
                                Flushbar(
                                  message: 'You click on Forgot password?',
                                  backgroundColor: widget.isDarkMode ? primaryColorDark : primaryColorLight,
                                  duration: const Duration(seconds: 2),
                                  margin: const EdgeInsets.all(8),
                                  borderRadius: BorderRadius.circular(8),
                                )..show(context);
                              },
                              child: Text(
                                'Forgot password?',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  color: widget.isDarkMode ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 36.0),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  final email = emailController.text.trim();
                                  final password = passwordController.text.trim();

                                  // If login is successful (only with dummy data)
                                  if (email == 'test@gmail.com' && password == 'Ace12345') {
                                    Flushbar(
                                      message: 'Login successful',
                                      backgroundColor: successColor,
                                      duration: const Duration(seconds: 2),
                                      margin: const EdgeInsets.all(8),
                                      borderRadius: BorderRadius.circular(8),
                                    )..show(context);

                                    // Save login info to SharedPreferences
                                    await _saveLoginInfo(email, password);

                                    Future.delayed(const Duration(seconds: 1), () {
                                      // Navigate to Home
                                      Navigator.pushReplacement(
                                        context,
                                        PageRouteBuilder(
                                          transitionDuration: const Duration(milliseconds: 600),
                                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                            const begin = Offset(1.0, 0.0);
                                            const end = Offset.zero;
                                            const curve = Curves.slowMiddle;

                                            final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                            final offsetAnimation = animation.drive(tween);

                                            return SlideTransition(
                                              position: offsetAnimation,
                                              child: child,
                                            );
                                          },
                                          pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(
                                            isDarkMode: widget.isDarkMode,
                                            onToggleTheme: widget.onToggleTheme,
                                          ),
                                        ),
                                      );
                                    });
                                  } else {
                                    // If login is not successful
                                    Flushbar(
                                      message: 'Invalid email or password',
                                      backgroundColor: Colors.red,
                                      duration: const Duration(seconds: 2),
                                      margin: const EdgeInsets.all(8),
                                      borderRadius: BorderRadius.circular(8),
                                    )..show(context);
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0XFF4E68AA),
                              elevation: 5,
                              shadowColor: Colors.black.withOpacity(1.0),
                            ),
                            child: const Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat',
                                  fontSize: 16.0
                                )
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      Text(
                        'or sign-in with',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                          color: widget.isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Flushbar(
                                  message: 'You click on Google sign-in',
                                  backgroundColor: widget.isDarkMode ? primaryColorDark : primaryColorLight,
                                  duration: const Duration(seconds: 2),
                                  margin: const EdgeInsets.all(8),
                                  borderRadius: BorderRadius.circular(8),
                                )..show(context);
                              },
                              child: Image.asset(
                                'assets/images/google.png',
                                width: 24.0,
                                height: 24.0,
                              ),
                            ),
                            const SizedBox(width: 20.0),
                            InkWell(
                              onTap: () {
                                Flushbar(
                                  message: 'You click on Apple sign-in',
                                  backgroundColor: widget.isDarkMode ? primaryColorDark : primaryColorLight,
                                  duration: const Duration(seconds: 2),
                                  margin: const EdgeInsets.all(8),
                                  borderRadius: BorderRadius.circular(8),
                                )..show(context);
                              },
                              child: Image.asset(
                                widget.isDarkMode ?
                                  'assets/images/apple_white.png' :
                                  'assets/images/apple.png',
                                width: 24.0,
                                height: 24.0,
                              ),
                            ),
                            const SizedBox(width: 20.0),
                            InkWell(
                              onTap: () {
                                Flushbar(
                                  message: 'You click on Facebook sign-in',
                                  backgroundColor: widget.isDarkMode ? primaryColorDark : primaryColorLight,
                                  duration: const Duration(seconds: 2),
                                  margin: const EdgeInsets.all(8),
                                  borderRadius: BorderRadius.circular(8),
                                )..show(context);
                              },
                              child: Image.asset(
                                'assets/images/facebook.png',
                                width: 30.0,
                                height: 30.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'New here?',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16.0,
                              color: widget.isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                          // Link to Sign-up page
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              splashFactory: NoSplash.splashFactory,
                            ),
                            child: InkWell(
                              onTap: () {
                                Flushbar(
                                  message: 'You click on Sign-up',
                                  backgroundColor: widget.isDarkMode ? primaryColorDark : primaryColorLight,
                                  duration: const Duration(seconds: 2),
                                  margin: const EdgeInsets.all(8),
                                  borderRadius: BorderRadius.circular(8),
                                )..show(context);
                              },
                              child: Text(
                                'Sign-up',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: widget.isDarkMode ? Colors.lightBlue : Color(0XFF1109FF),
                                  fontSize: 16.0,
                                ),
                              ),
                            )
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
