import 'package:dental385/themes.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarioPersonal extends StatefulWidget {
  const CalendarioPersonal({
    required this.toHighlight,
    Key? key,
  }) : super(key: key);

  @override
  _CalendarioPersonalState createState() => _CalendarioPersonalState();

  final List<DateTime> toHighlight;
}

class _CalendarioPersonalState extends State<CalendarioPersonal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColorPersonal,
          title: const Text('Calendario de Citas'),
        ),
        body: Center(
            child: Column(children: [
          TableCalendar(
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, focusedDay) {
                for (DateTime d in widget.toHighlight) {
                  if (day.day == d.day &&
                      day.month == d.month &&
                      day.year == d.year) {
                    return Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 0, 230, 210),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '${day.day}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  }
                }
                return null;
              },
            ),
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
          )
        ])));
  }
}
