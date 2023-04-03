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
        final h = MediaQuery.of(context).size.height;
        final w = MediaQuery.of(context).size.width;
        return AlertDialog(
            title: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -80,
                  left: 300,
                  child: Image.asset(
                    'assets/logos/logo_barberia_color.png',
                    width: 120,
                    height: 120,
                  ),
                ),
                const Text('Reserve su turno'),
              ],
            ),
            content: Container(
              padding: const EdgeInsets.all(SizesApp.padding15),
              height: h * 0.6,
              width: w * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(SizesApp.padding10),
                color: Colors.black,
              ),
              child: Form(
                child: Column(
                  children: [
                    SizesApp.addVerticalSpace(SizesApp.padding15),
                    Row(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              width: 400,
                              child: TextFormField(
                                decoration: StylesApp.inputDecorationName,
                                initialValue: 'manolo',
                              ),
                            ),
                            SizesApp.addVerticalSpace(SizesApp.padding15),
                            SizedBox(
                              width: 400,
                              child: TextFormField(
                                decoration: StylesApp.inputDecorationEmail,
                                initialValue: 'example@hotmaill.com',
                              ),
                            ),
                          ],
                        ),
                        SizesApp.addHorizontalSpace(SizesApp.padding25),
                        Column(
                          children: [
                            const Text('Su turno sera: '),
                            SizesApp.addVerticalSpace(SizesApp.padding10),
                            Text(today.toString().split(" ")[0]),
                            SizesApp.addVerticalSpace(SizesApp.padding10),
                            const Icon(Icons.edit),
                          ],
                        ),
                      ],
                    ),
                    SizesApp.addVerticalSpace(SizesApp.padding15),
                    const Divider(
                      color: Colors.white,
                    ),
                    SizesApp.addHorizontalSpace(SizesApp.padding15),
                    Text(
                      'Elija su servicio',
                      style: FontsApp.oldStandardTt.copyWith(fontSize: 17),
                    ),
                    SizedBox(
                      height: 100,
                      width: 400,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          SizedBox(
                            width: 300,
                            // height: 200,
                            child: RadioListTile(
                              title: const Text('Corte de pelo'),
                              value: 1,
                              groupValue: 1,
                              onChanged: (value) {
                                setState(() {});
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizesApp.addVerticalSpace(SizesApp.padding15),
                  ],
                ),
              ),
            ));
      },
    );
  }

  /* 
    RadioListTile(
                            title: const Text('Corte de pelo'),
                            value: 1,
                            groupValue: 1,
                            onChanged: (value) {
                              setState(() {});
                            },
                          ),
                          RadioListTile(
                            title: const Text('Recorte de barba'),
                            value: 2,
                            groupValue: 1,
                            onChanged: (value) {
                              setState(() {});
                            },
                          ),
                          RadioListTile(
                            title: const Text('Niños'),
                            value: 3,
                            groupValue: 1,
                            onChanged: (value) {
                              setState(() {});
                            },
                          ),
   */

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
