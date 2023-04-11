class Turno {
  final int turn;
  bool isActive;
  final bool? abonado;
  final String user;
  final DateTime time;
  final DateTime day;
  final double price;

  Turno({
    required this.turn,
    this.isActive = true,
    required this.abonado,
    required this.user,
    required this.time,
    required this.day,
    required this.price,
  });

  factory Turno.fromMap(Map<String, dynamic> json) => Turno(
        turn: json['turn'],
        abonado: json['abonado'],
        user: json['user'],
        time: json['time'],
        day: json['day'],
        price: json['price'],
      );

  String formattedDay() => '${day.day}/${day.month}/${day.year}';
}
