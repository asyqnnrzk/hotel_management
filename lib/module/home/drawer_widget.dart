import 'package:flutter/material.dart';
import 'package:hotel_management/source/colors.dart';
import 'package:another_flushbar/flushbar.dart';

class DrawerWidget extends StatefulWidget {
  final bool isDarkMode;
  const DrawerWidget({super.key, required this.isDarkMode});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  int selectedIndex = 0;

  // List of items on drawer/sidebar menu
  final List<Map<String, dynamic>> drawerItems = [
    {'title': 'Home', 'icon': 'assets/icons/home.png'},
    {'title': 'Bookings', 'icon': 'assets/icons/bookings.png'},
    {'title': 'Rooms', 'icon': 'assets/icons/rooms.png'},
    {'title': 'Guests', 'icon': 'assets/icons/guests.png'},
    {'title': 'Staff', 'icon': 'assets/icons/staff.png'},
    {'title': 'Settings', 'icon': 'assets/icons/settings.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: widget.isDarkMode ? primaryColorDark : primaryColorLight,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: drawerItems.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) return const SizedBox(height: 75);
          final item = drawerItems[index - 1];
          final isSelected = selectedIndex == index - 1;

          // Highlight the selected item
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              color: isSelected
                  ? (widget.isDarkMode ? secondaryColorDark : secondaryColorLight)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                switchInCurve: Curves.easeInOutCubic,
                switchOutCurve: Curves.easeInOutCubic,
                transitionBuilder: (child, animation) {
                  final slide = Tween<Offset>(
                    begin: const Offset(-0.8, 0),
                    end: Offset.zero,
                  ).animate(CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeInOutCubic,
                  ));

                  final fade = CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeInOut,
                  );

                  return SlideTransition(
                    position: slide,
                    child: FadeTransition(
                      opacity: fade,
                      child: child,
                    ),
                  );
                },
                child: Image.asset(
                  item['icon'],
                  key: ValueKey<bool>(isSelected),
                  width: 32,
                  height: 32,
                  color: isSelected
                      ? (widget.isDarkMode ? Colors.white : Colors.black54)
                      : (widget.isDarkMode ? Colors.white70 : secondaryColorLight),
                ),
              ),
              title: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: isSelected
                      ? (widget.isDarkMode ? Colors.white : Colors.black54)
                      : (widget.isDarkMode ? Colors.white70 : secondaryColorLight),
                  fontSize: isSelected ? 22.0 : 20.0,
                  fontWeight: FontWeight.bold,
                ),
                child: Text(item['title']),
              ),
              selected: isSelected,
              selectedTileColor:
              widget.isDarkMode ? secondaryColorDark : secondaryColorLight,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              onTap: () {
                setState(() {
                  selectedIndex = index - 1;
                });

                Flushbar(
                  message: 'You click on ${item['title']}',
                  backgroundColor:
                  widget.isDarkMode ? primaryColorDark : primaryColorLight,
                  duration: const Duration(seconds: 2),
                  margin: const EdgeInsets.all(8),
                  borderRadius: BorderRadius.circular(8),
                )..show(context);
              },
            ),
          );
        },
      ),
    );
  }
}

