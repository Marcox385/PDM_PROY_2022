import 'package:flutter/material.dart';

class PerfilPaciente extends StatelessWidget {
  const PerfilPaciente({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 45, 155, 240),
        title: const Text('Mi Perfil'),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: CircleAvatar(
                child: Icon(Icons.cell_tower_rounded),
                radius: 80,
              ),
            ),
            Text("Paciente"),
            Text("{{nombre de paciente}}"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(),
            ),
            Text("Teléfono"),
            Text("{{telefono de paciente}}"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(),
            ),
            Text("Fecha de nacimiento"),
            Text("{{fecha de nacimiento de paciente}}"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(),
            ),
            Text("Sexo"),
            Text("{{sexo de paciente}}")
          ],
        ),
      ),
    );
  }
}
