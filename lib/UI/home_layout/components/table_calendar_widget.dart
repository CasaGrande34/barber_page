import 'package:flutter/material.dart';

import '../../../utils/sizes_app.dart';
import 'package:table_calendar/table_calendar.dart';

class TableCalendarWidget extends StatefulWidget {
  const TableCalendarWidget({
    super.key,
  });

  @override
  State<TableCalendarWidget> createState() => _TableCalendarWidgetState();
}

class _TableCalendarWidgetState extends State<TableCalendarWidget> {
  CalendarFormat format = CalendarFormat.week;
  late DateTime focusedDay1;
  late DateTime _selectedDay;

  @override
  void initState() {
    _selectedDay = DateTime.now();
    focusedDay1 = DateTime.now();
    super.initState();
  }

  void onDaySelect(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      focusedDay1 = focusedDay;
      // print(_selectedDay);
    });
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return TableCalendar(
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
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
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
    );
  }
}
