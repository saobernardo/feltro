//import 'dart:ui';

import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';

class TableCalendarWidget extends StatefulWidget {
  @override
  _TableCalendarWidgetState createState() => _TableCalendarWidgetState();
}

class _TableCalendarWidgetState extends State<TableCalendarWidget> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'pt_BR',
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      calendarFormat: CalendarFormat.week,
      availableCalendarFormats: {
        CalendarFormat.month: 'Mes',
        CalendarFormat.week: 'Semana',
      },
      headerStyle: HeaderStyle(
          titleCentered: true,
          formatButtonVisible: false,
          leftChevronIcon: Icon(Icons.arrow_left,
              color: Theme.of(context).colorScheme.secondary, size: 30),
          rightChevronIcon: Icon(Icons.arrow_right,
              color: Theme.of(context).colorScheme.secondary, size: 30),
          headerPadding: EdgeInsets.only(bottom: 10),
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 17)),
      daysOfWeekHeight: 25,
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: TextStyle(
            color: Theme.of(context).colorScheme.background,
            fontWeight: FontWeight.bold,
            fontSize: 18),
      ),
      calendarStyle: CalendarStyle(
        defaultTextStyle: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
        ),
        weekendTextStyle:
            TextStyle(color: Theme.of(context).colorScheme.secondary),
      ),
      focusedDay: _focusedDay,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          // Call `setState()` when updating the selected day
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        }
      },
      onFormatChanged: (format) {},
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
    );
  }
}
