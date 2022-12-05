import 'package:dental385/Pages/Personal/personal_service.dart';
import 'package:dental385/themes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                  int citaType = -1;
                  DateTime now = DateTime.now();
                  print(citasToday[index].hour);
                  print(now.hour);
                  if (citasToday[index].hour > now.hour) {
                    citaType = 0;
                  } else {
                    citaType = 1;
                  }
                  return _listItem(
                      context, formatter.format(citasToday[index]), citaType);
                }));
          })),
    );
  }

  Widget _listItem(context, String citaTime, int citaType) {
    dynamic icon, color;
    switch (citaType) {
      case 0:
        icon = FontAwesomeIcons.clock;
        color = Colors.green;
        break;
      case 1:
        icon = FontAwesomeIcons.clock;
        color = Colors.red;
        break;
      default:
        icon = FontAwesomeIcons.clock;
        color = Colors.yellow;
    }
    return Card(
      child: ListTile(
        leading: Icon(icon, color: color, size: 40.0),
        title: Text(citaTime, style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
