import 'package:flutter/material.dart';

class PerfilPaciente extends StatelessWidget {
  const PerfilPaciente({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: CircleAvatar(
              child: Icon(Icons.cell_tower_rounded),
              radius: 80,
            ),
          ),
          Text("Paciente", style: TextStyle(fontWeight: FontWeight.bold)),
          Text("{{nombre de paciente}}"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(thickness: 1.0),
          ),
          Text("Teléfono", style: TextStyle(fontWeight: FontWeight.bold)),
          Text("{{telefono de paciente}}"),
          Divider(),
          Text("Fecha de nacimiento",
              style: TextStyle(fontWeight: FontWeight.bold)),
          Text("{{fecha de nacimiento de paciente}}"),
          Divider(),
          Text("Sexo", style: TextStyle(fontWeight: FontWeight.bold)),
          Text("{{sexo de paciente}}")
        ],
      ),
    );
  }
}
