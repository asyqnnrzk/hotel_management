# hotel_management
<<<<<<< HEAD
Technical assessment for hotel management system
=======

A Flutter project for Hotel Management System

## Getting Started

*****

Overview:

A modern Flutter-based hotel management system to handle bookings, guest info, room status, and more — designed for both light and dark mode.

*****

Features:

- Login page
- Menu/Home page
- Sidebar menu
- View upcoming bookings
- Dark mode & light mode toggle
- Loads data from JSON (locally)
- Save user data in SharedPreferences

*****

Technologies used:

- UI Framework: Flutter
- Programming language: Dart
- Custom snackbar/alerts: Flushbar
- Dummy data: JSON

*****

Project structure:

lib/
│
├── module/
│   ├── home/
│   |   ├── booking_details_widget.dart
│   |   ├── booking_model.dart
│   |   ├── drawer_widget.dart
│   |   └── home_screen.dart
│   |
│   └── login/
│       └── login_screen.dart
│
├── source/
│   ├── colors.dart
│   └── theme.dart
│
└── main.dart

*****

Installation steps:

Make a new folder in your laptop/pc and write these on that folder command prompt:
git clone https://github.com/asyqnnrzk/hotel_management
cd hotel_management
flutter pub get
flutter run

or

Install the APK file in ZIP file attached.

*****

Adding or changing data:

Adding or changing the defined JSON data can be made with installation by cloning the code. JSON data is located in hotel_management/assets/data/booking_data.json.
To change the login email or password, go to hotel_management/lib/module/login/login_screen.dart, line 236.

*****

Bonus implementation:

- Dark mode can be toggled on the menu page.
- Transitions are added on the navigation from login to menu page and on the sidebar menu when changing highlight item.
- Local storage is used to save user's email and password upon login successfully.

*****

Flutter dependencies used (can be viewed on pubspec.yaml file:

- another_flushbar: ^1.10.28
- shared_preferences: ^2.3.3