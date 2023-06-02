import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../../../providers/dialog_provider.dart';
import '../../../../../../../utils/utils.dart';

class ReservaTurno extends StatefulWidget {
  const ReservaTurno({
    super.key,
  });

  @override
  State<ReservaTurno> createState() => _ReservaTurnoState();
}

class _ReservaTurnoState extends State<ReservaTurno> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<DialogProvider>(context, listen: false).setContext(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dialog = Provider.of<DialogProvider>(context);
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
            children: const [
              SizedBox(
                width: 280,
                child: ListTile(
                  title: Text('Su turno sera:'),
                  // trailing: Text(dialog.today.toString().split(" ")[0]),
                ),
              ),
            ],
          ),
        ),
        SizesApp.addVerticalSpace(15),
        SizedBox(
          width: 350,
          child: TableCalendar(
            // selectedDayPredicate: (day) => isSameDay(day, dialog.today),
            headerStyle: const HeaderStyle(
                formatButtonVisible: false, titleCentered: true),
            rowHeight: 43,
            availableGestures: AvailableGestures.all,
            firstDay: DateTime.utc(2015, 05, 05),
            focusedDay: DateTime.now(),
            lastDay: DateTime.utc(2025, 05, 05),
            onDaySelected: (day, da) => dialog.show,
          ),
        )
      ],
    );
  }
}
