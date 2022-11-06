import 'package:flutter/material.dart';

class HistorialPaciente extends StatelessWidget {
  const HistorialPaciente({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(title: Text("Cita del 15 de septiembre de 2022")),
        ListTile(title: Text("Cita del 15 de septiembre de 2021"))
      ],
    );
  }
}
