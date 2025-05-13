import 'package:flutter/material.dart';

class BookingDetailsWidget extends StatelessWidget {
  final String roomNumber;
  final String checkIn;
  final String checkOut;
  final String status;
  final bool isDarkMode;

  const BookingDetailsWidget({
    super.key,
    required this.roomNumber,
    required this.checkIn,
    required this.checkOut,
    required this.status,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    final labelColor = isDarkMode ? Colors.grey[300] : Colors.black54;
    final valueColor = isDarkMode ? Colors.white : Colors.black;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Room number: ',
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: labelColor,
              ),
            ),
            Text(
              roomNumber,
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: valueColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              'Check-in: ',
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: labelColor,
              ),
            ),
            Text(
              checkIn,
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: valueColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              'Check-out: ',
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: labelColor,
              ),
            ),
            Text(
              checkOut,
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: valueColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              'Status: ',
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: labelColor,
              ),
            ),
            Text(
              status,
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: status == 'Confirmed'
                    ? Colors.green
                    : status == 'Pending'
                    ? Colors.amber
                    : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

