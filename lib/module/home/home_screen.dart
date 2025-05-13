import 'package:flutter/material.dart';
import 'package:hotel_management/module/home/drawer_widget.dart';
import 'package:hotel_management/source/colors.dart';
import 'booking_details_widget.dart';
import 'package:another_flushbar/flushbar.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:hotel_management/module/home/booking_model.dart';

class HomeScreen extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const HomeScreen({super.key, required this.isDarkMode, required this.onToggleTheme});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Booking> bookings = [];

  @override
  void initState() {
    super.initState();
    loadBookings();
  }

  Future<void> loadBookings() async {
    final String response = await rootBundle.loadString('assets/data/booking_data.json');
    final data = json.decode(response) as List;
    setState(() {
      // dummy JSON data
      bookings = data.map((json) => Booking.fromJson(json)).toList();
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: widget.isDarkMode ? secondaryColorDark : secondaryColorLight,
        appBar: AppBar(
          toolbarHeight: 100.0,
          backgroundColor: widget.isDarkMode ? primaryColorDark : primaryColorLight,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20.0),
            ),
          ),
          iconTheme: const IconThemeData(
              color: secondaryColorLight,
              size: 32.0
          ),
          actions: [
            // Dark mode button toggle
            IconButton(
              onPressed: widget.onToggleTheme,
              icon: Icon(widget.isDarkMode ? Icons.dark_mode : Icons.light_mode),
              tooltip: 'Toggle Theme',
            ),
            IconButton(
              onPressed: () {
                Flushbar(
                  message: 'You click on profile',
                  backgroundColor: widget.isDarkMode ? primaryColorDark : primaryColorLight,
                  duration: const Duration(seconds: 2),
                  margin: const EdgeInsets.all(8),
                  borderRadius: BorderRadius.circular(8),
                )..show(context);
              },
              icon: const Icon(Icons.person_3_rounded),
              tooltip: 'Profile',
            ),
          ],
        ),
        drawer: DrawerWidget(isDarkMode: widget.isDarkMode),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Upcoming bookings',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20.0,
                    color: widget.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  '${bookings.length} bookings',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: widget.isDarkMode ? Colors.white: Colors.black54,
                  ),
                ),
                const SizedBox(height: 30.0),
                // Cards to display data
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: bookings.length,
                  itemBuilder: (context, index) {
                    final booking = bookings[index];
                    return Column(
                      children: [
                        Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: widget.isDarkMode ? cardGradientDark : cardGradientLight,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              leading: Icon(
                                Icons.hotel,
                                color: widget.isDarkMode ? Colors.white : Colors.black
                              ),
                              title: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  'Guest name: ${booking.guestName}',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: widget.isDarkMode ? Colors.white : Colors.black,
                                  ),
                                ),
                              ),
                              subtitle: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: BookingDetailsWidget(
                                  roomNumber: booking.roomNumber,
                                  checkIn: booking.checkIn,
                                  checkOut: booking.checkOut,
                                  status: booking.status,
                                  isDarkMode: widget.isDarkMode,
                                ),
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                color: secondaryColorLight,
                              ),
                              onTap: () {
                                Flushbar(
                                  message: 'You click on card',
                                  backgroundColor: widget.isDarkMode ? primaryColorDark : primaryColorLight,
                                  duration: const Duration(seconds: 2),
                                  margin: const EdgeInsets.all(8),
                                  borderRadius: BorderRadius.circular(8),
                                )..show(context);
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
