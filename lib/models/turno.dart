import 'package:landing_page/models/service.dart';

class CategoryTurnos {
  final String title;
  final List<Turno> turnos;

  CategoryTurnos({required this.title, required this.turnos});
}

class Turno {
  final int turn;
  bool isActive;
  final bool abonado;
  final String user;
  final DateTime day;
  final String profesionalElegido;
  final ServiceBarber service;

  Turno({
    required this.service,
    required this.turn,
    this.isActive = true,
    required this.abonado,
    required this.user,
    required this.day,
    required this.profesionalElegido,
  });

  factory Turno.fromMap(Map<String, dynamic> json) => Turno(
        turn: json['turn'],
        abonado: json['abonado'],
        user: json['user'],
        day: json['day'],
        profesionalElegido: json['profesionalElegido'],
        service: json['service'],
      );

  String formattedDay() => '${day.day}/${day.month}/${day.year}';
}

// TODO: Listado hardcodeado por el momento, falta implementar base de datos.
List<CategoryTurnos> listadeTurnos = [
  CategoryTurnos(
    title: 'Turnos Activos',
    turnos: [
      Turno(
        turn: 1,
        service: ServiceBarber(
            name: 'Corte de pelo',
            price: 2300,
            asset: 'assets/icons/tijera_blanca.png'),
        abonado: false,
        user: 'Matias Echavarria',
        day: DateTime.now(),
        profesionalElegido: 'Rodrigo Perex',
      ),
      Turno(
        turn: 2,
        abonado: true,
        service: ServiceBarber(
            name: 'Barba', price: 1200, asset: 'assets/icons/barba_blanca.png'),
        user: 'Shakira',
        day: DateTime.now(),
        profesionalElegido: 'Gerardo Fuseneco',
      ),
    ],
  )
];
