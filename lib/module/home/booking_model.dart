class Booking {
  final String guestName;
  final String roomNumber;
  final String checkIn;
  final String checkOut;
  final String status;

  Booking({
    required this.guestName,
    required this.roomNumber,
    required this.checkIn,
    required this.checkOut,
    required this.status,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
    guestName: json['guestName'],
    roomNumber: json['roomNumber'],
    checkIn: json['checkIn'],
    checkOut: json['checkOut'],
    status: json['status'],
  );
}
