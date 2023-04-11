import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:landing_page/models/turno.dart';
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
  late DateTime _selectedDay;
  late DateTime _focusedDay;

  @override
  void initState() {
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final appTheme = Provider.of<ThemeCharger>(context).currentTheme;
    final themeChangerButton = Provider.of<ThemeCharger>(context);

    void onDaySelect(DateTime selectedDay, DateTime focusedDay) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        print(_selectedDay);
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
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
                  formatButtonTextStyle: const TextStyle(color: Colors.white),
                ),
                calendarBuilders: CalendarBuilders(
                  todayBuilder: (context, day, focusedDay) => Center(
                    child: Text(day.day.toString()),
                  ),
                  markerBuilder: (context, day, events) {
                    var appts = '5';
                    return Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        alignment: Alignment.center,
                        height: w * 0.04,
                        width: w * 0.04,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.cyan),
                        child: Text(
                          appts,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                  },
                ),
                selectedDayPredicate: (day) => _selectedDay == day,
                rowHeight: 43,
                availableGestures: AvailableGestures.all,
                firstDay: DateTime.utc(2015, 05, 05),
                focusedDay: _selectedDay,
                lastDay: DateTime.utc(2025, 05, 05),
                onDaySelected: onDaySelect,
              ),
              SizesApp.addVerticalSpace(SizesApp.padding20),
              const ListTurns(),
            ],
          ),
        ),
      ),
    );
  }
}

class ListTurns extends StatelessWidget {
  const ListTurns({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    List<Turno> turnos = [];

    return Container(
      height: h,
      width: w * 0.9,
      color: Colors.amber,
      child: ListView.builder(
        itemCount: turnos.length,
        itemBuilder: (context, index) {
          final turno = turnos[index];
          return ItemTurnos(
            user: turno.user,
          );
        },
      ),
    );
  }
}

class ItemTurnos extends StatelessWidget {
  final String user;
  const ItemTurnos({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return const ListTile(
        // title: Text(user.user),
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
