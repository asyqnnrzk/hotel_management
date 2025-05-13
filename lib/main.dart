import 'package:flutter/material.dart';
import 'module/login/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hotel_management/source/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Save the latest app mode preference
  final prefs = await SharedPreferences.getInstance();
  final isDarkMode = prefs.getBool('isDarkMode') ?? false;
  runApp(HotelApp(isDarkMode: isDarkMode));
}

class HotelApp extends StatefulWidget {
  const HotelApp({super.key, required this.isDarkMode});
  final bool isDarkMode;

  @override
  State<HotelApp> createState() => _HotelAppState();
}

class _HotelAppState extends State<HotelApp> {
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    isDarkMode = widget.isDarkMode;
  }

  // Toggle the UI and colors based on mode
  void toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() => isDarkMode = !isDarkMode);
    await prefs.setBool('isDarkMode', isDarkMode);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: widget.isDarkMode ? darkTheme : lightTheme,
      home: LoginScreen(
        isDarkMode: isDarkMode,
        onToggleTheme: toggleTheme,
      ),
    );
  }
}
