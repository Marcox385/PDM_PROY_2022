import 'package:flutter/material.dart';

class HistorialPaciente extends StatelessWidget {
  const HistorialPaciente({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 45, 155, 240),
          title: const Text('Historial'),
        ),
        body: ListView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text("Cita del 15 de septiembre de 2022"),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text("Cita del 15 de septiembre de 2021"),
              ),
            )
          ],
        ));
  }
}