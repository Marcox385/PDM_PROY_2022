import 'package:dental385/Pages/Paciente/pacient_service.dart';
import 'package:dental385/Pages/Personal/personal_service.dart';
import 'package:dental385/themes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CitasPersonal extends StatelessWidget {
  final DateFormat formatter = DateFormat('HH:mm');
  CitasPersonal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColorPersonal,
        title: const Text('Citas'),
      ),
      body: FutureBuilder(
          future: PersonalService().personalGetCitasToday(),
          builder: ((context, data) {
            if (!data.hasData)
              return Center(child: CircularProgressIndicator());
            var citasToday = data.data as List;
            if (citasToday.length == 0)
              return Center(
                  child: Text('No hay citas registradas el día de hoy'));

            return ListView.builder(
                itemCount: citasToday.length,
                itemBuilder: ((context, index) {
                  print(citasToday[index].hour);
                  print(citasToday[index].minute);
                  print(formatter.format(citasToday[index]));
                  return _listItem(
                      context, formatter.format(citasToday[index]));
                }));
          })),
    );
  }

  Widget _listItem(context, String citaTime) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.verified_user, color: Colors.black, size: 40.0),
        title: Text(citaTime, style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
