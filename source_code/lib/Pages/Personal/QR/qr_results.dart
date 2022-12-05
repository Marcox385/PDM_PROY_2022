import 'package:dental385/Pages/Personal/Home/main_personal.dart';
import 'package:dental385/themes.dart';
import 'package:flutter/material.dart';

class QRResults extends StatelessWidget {
  final String raw_data;
  const QRResults({super.key, required this.raw_data});

  List<String> parseQR(String raw_data) {
    return raw_data.split('||');
  }

  @override
  Widget build(BuildContext context) {
    List data = parseQR(raw_data);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColorPersonal,
          title: Text('Datos del paciente'),
          actions: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => MainPersonal()),
                    (route) => false);
              },
            )
          ],
        ),
        body: ListView(
          children: [
            Card(
                child: ListTile(
                    leading: Icon(Icons.person, size: 50.0),
                    title: Text('Nombre'),
                    subtitle: Text('${data[0]}'))),
            Card(
                child: ListTile(
                    leading: Icon(Icons.calendar_month, size: 50.0),
                    title: Text('Cita'),
                    subtitle: Text('${data[1]}'))),
            Card(
                child: ListTile(
                    leading: Icon(Icons.cake, size: 50.0),
                    title: Text('Fecha de nacimiento'),
                    subtitle: Text('${data[2]}'))),
          ],
        ));
  }
}
