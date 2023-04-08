import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../utils/utils.dart';
import '../../../../utils/buttons/button_blue.dart';
import 'package:landing_page/theme/theme_changer.dart';

class TurnosScreen extends StatefulWidget {
  const TurnosScreen({super.key});

  @override
  State<TurnosScreen> createState() => _TurnosScreenState();
}

class _TurnosScreenState extends State<TurnosScreen> {
  CalendarFormat format = CalendarFormat.week;
  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeCharger>(context).currentTheme;
    final themeChangerButton = Provider.of<ThemeCharger>(context);

    DateTime today = DateTime.now();

    void onDaySelect(DateTime day, DateTime focusedDay) {
      setState(() {
        today = day;
      });
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: themeChangerButton.toggleTheme,
          icon: (themeChangerButton.isDark == true)
              ? Icon(FontAwesomeIcons.moon, color: appTheme.colorScheme.primary)
              : const Icon(FontAwesomeIcons.sun),
        ),
        title: Text(
          'Turnos',
          style: FontsApp.oldStandardTt.copyWith(fontSize: 22),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizesApp.padding15),
        child: Column(
          children: [
            SizesApp.addVerticalSpace(SizesApp.padding20),
            const _FirstSection(),
            TableCalendar(
              calendarFormat: format,

              //To style the calendar
              calendarStyle: CalendarStyle(
                  isTodayHighlighted: true,
                  selectedDecoration: BoxDecoration(
                    color: Colors.black38,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(SizesApp.padding5),
                  ),
                  selectedTextStyle: const TextStyle(color: Colors.white),
                  todayDecoration: BoxDecoration(
                    color: Colors.pink,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(SizesApp.padding5),
                  )),
              headerStyle: HeaderStyle(
                  leftChevronVisible: false,
                  rightChevronVisible: false,
                  formatButtonVisible: false,
                  titleCentered: true,
                  formatButtonShowsNext: false,
                  formatButtonDecoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(SizesApp.padding5),
                  ),
                  formatButtonTextStyle: const TextStyle(color: Colors.white)),

              selectedDayPredicate: (day) => isSameDay(day, today),
              rowHeight: 43,
              availableGestures: AvailableGestures.all,
              firstDay: DateTime.utc(2015, 05, 05),
              focusedDay: today,
              lastDay: DateTime.utc(2025, 05, 05),
              onDaySelected: onDaySelect,
            ),
            SizesApp.addVerticalSpace(SizesApp.padding20),
          ],
        ),
      ),
    );
  }
}

class _FirstSection extends StatelessWidget {
  const _FirstSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat.yMMMMd().format(DateTime.now()),
              // DateFormat.yMMMMd().format(DateTime.now()),
              style: FontsApp.nunito.copyWith(fontSize: 19),
            ),
            const Text('Hoy'),
          ],
        ),
        const Spacer(),
        SizedBox(
          height: 40,
          width: 100,
          child: ButtonBlue(
            text: 'Turno +',
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
