// Pre-determined file for colors
import 'package:flutter/material.dart';

// Light mode (default) colors
const primaryGradientLight = LinearGradient(
  colors: [Color(0xFF688AE4), Color(0xFFF5E6CC)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

const cardGradientLight = LinearGradient(
  colors: [Color(0xFFF5E6CC), Color(0xFF688AE4)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

const primaryColorLight = Color(0xFF688AE4);
const secondaryColorLight = Color(0xFFF5E6CC);

// Dark mode colors
const primaryGradientDark = LinearGradient(
  colors: [Color(0xFF162032), Color(0xFF504E4E)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

const cardGradientDark = LinearGradient(
  colors: [Color(0xFF504E4E), Color(0xFF162032)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

const primaryColorDark = Color(0xFF162032);
const secondaryColorDark = Color(0xFF504E4E);

const successColor = Colors.lightGreen;