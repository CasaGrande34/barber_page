class Turno {
  final int id;
  bool isActive;
  final bool? abonado;
  final String user;
  final DateTime time;
  final DateTime day;
  final double price;

  Turno({
    required this.id,
    this.isActive = true,
    required this.abonado,
    required this.user,
    required this.time,
    required this.day,
    required this.price,
  });

  factory Turno.fromMap(Map<String, dynamic> json) => Turno(
        id: json['id'],
        abonado: json['abonado'],
        user: json['user'],
        time: json['time'],
        day: json['day'],
        price: json['price'],
      );
}
