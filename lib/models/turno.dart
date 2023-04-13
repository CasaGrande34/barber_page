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
  final String service;
  final double price;
  final String iconService;
  final String profesionalElegido;

  Turno({
    required this.turn,
    this.isActive = true,
    required this.abonado,
    required this.user,
    required this.day,
    required this.service,
    required this.price,
    required this.iconService,
    required this.profesionalElegido,
  });

  factory Turno.fromMap(Map<String, dynamic> json) => Turno(
      turn: json['turn'],
      abonado: json['abonado'],
      user: json['user'],
      day: json['day'],
      service: json['service'],
      profesionalElegido: json['profesionalElegido'],
      price: json['price'],
      iconService: json['iconService']);

  String formattedDay() => '${day.day}/${day.month}/${day.year}';
}

// TODO: Listado hardcodeado por el momento, falta implementar base de datos.
List<CategoryTurnos> listadeTurnos = [
  CategoryTurnos(
    title: 'Turnos Activos',
    turnos: [
      Turno(
        turn: 1,
        iconService: 'assets/icons/tijera_blanca.png',
        abonado: false,
        user: 'Matias Echavarria',
        day: DateTime.now(),
        service: 'Corte de pelo',
        profesionalElegido: 'Rodrigo Galloso',
        price: 2400,
      ),
      Turno(
        turn: 2,
        iconService: 'assets/icons/barba_blanca.png',
        abonado: true,
        user: 'Shakira',
        day: DateTime.now(),
        service: 'Colorizado + Recorte de barba',
        profesionalElegido: 'Gerardo Fuseneco',
        price: 2400,
      ),
    ],
  )
];
