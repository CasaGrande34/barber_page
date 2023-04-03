import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../../utils/utils.dart';

class ReservaTurno extends StatefulWidget {
  const ReservaTurno({
    super.key,
  });

  @override
  State<ReservaTurno> createState() => _ReservaTurnoState();
}

class _ReservaTurnoState extends State<ReservaTurno> {
  List<String> categoriasServicio = [
    'Corte de barba',
    'Corte de pelo',
    'Otros'
  ];
  DateTime today = DateTime.now();

  void onDaySelect(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Reserve su turno'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Reserva tu turno',
          style: FontsApp.rye
              .copyWith(fontWeight: FontWeight.w800, fontSize: 25.0),
        ),
        SizesApp.addVerticalSpace(15),
        SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: const [
                  SizedBox(
                    width: 280,
                    child: ListTile(
                      title: Text('Elija su servicio:'),
                      trailing: Text('Categoria'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 280,
                child: ListTile(
                  title: const Text('Su turno sera:'),
                  trailing: Text(today.toString().split(" ")[0]),
                ),
              ),
            ],
          ),
        ),
        SizesApp.addVerticalSpace(15),
        SizedBox(
          width: 350,
          child: TableCalendar(
            selectedDayPredicate: (day) => isSameDay(day, today),
            headerStyle: const HeaderStyle(
                formatButtonVisible: false, titleCentered: true),
            rowHeight: 43,
            availableGestures: AvailableGestures.all,
            firstDay: DateTime.utc(2015, 05, 05),
            focusedDay: today,
            lastDay: DateTime.utc(2025, 05, 05),
            onDaySelected: onDaySelect,
          ),
        )
      ],
    );
  }
}
