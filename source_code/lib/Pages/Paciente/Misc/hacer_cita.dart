import 'dart:math';
import 'package:dental385/Pages/Paciente/pacient_service.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:url_launcher/url_launcher.dart';

class HacerCita extends StatefulWidget {
  const HacerCita({super.key});

  @override
  State<HacerCita> createState() => HacerCitaState();
}

class HacerCitaState extends State<HacerCita> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  int time = new Random().nextInt(10) + 15;
  PacientService service = PacientService();
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(_selectedDay, selectedDay)) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                }
              }),
          Center(
              child: Container(
            child: ElevatedButton(
                child: Text("Guardar cita"),
                onPressed: () {
                  DateTime _selectedTime =
                      _focusedDay.add(Duration(hours: time));
                  print(_selectedTime.toString());
                  service.pacientAddCita(_selectedTime);
                }),
          )),
          Expanded(child: Container()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Contacto directo:'),
              TextButton(
                  child: Text('33-2850-3259'),
                  onPressed: () async {
                    if (!await launchUrl(
                        Uri(scheme: 'tel', path: '3328503259')))
                      throw 'No es posible realizar llamadas en este dispositivo...';
                  }),
              Icon(Icons.phone)
            ],
          )
        ],
      ),
    );
  }
}