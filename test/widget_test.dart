// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:hotel_management/main.dart';

void main() {
  testWidgets('App loads with light mode by default', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});

    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool('isDarkMode') ?? false;

    await tester.pumpWidget(HotelApp(isDarkMode: isDarkMode));

    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.text('Welcome, Guest'), findsOneWidget);
  });
}

