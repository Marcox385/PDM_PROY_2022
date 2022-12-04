import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PerfilPaciente extends StatelessWidget {
  const PerfilPaciente({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _formated = Theme.of(context).textTheme.titleLarge;
    var _field = Theme.of(context).textTheme.titleMedium;
    SizedBox Separator = SizedBox(height: 20.0);

    final FirebaseAuth auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    return Container(
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(14.0),
              child: ClipOval(
                  child: SizedBox.fromSize(
                      size: Size.fromRadius(85.0),
                      child: (user!.photoURL == null)
                          ? CircleAvatar(
                              child: Icon(FontAwesomeIcons.tooth, size: 85.0))
                          : Image.network(user.photoURL!, fit: BoxFit.cover)))),
          Text("Paciente", style: _formated),
          Text("{{Nombre del paciente}}",
              style: _field, textAlign: TextAlign.center),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(thickness: 1.0),
          ),
          Text("Teléfono", style: _formated),
          Text("{{telefono de paciente}}",
              style: _field, textAlign: TextAlign.center),
          Separator,
          Text("Fecha de nacimiento", style: _formated),
          Text("{{fecha de nacimiento de paciente}}",
              style: _field, textAlign: TextAlign.center),
          Separator,
          Text("Sexo", style: _formated),
          Text("{{sexo de paciente}}",
              style: _field, textAlign: TextAlign.center),
          Expanded(child: Container()),
          TextButton.icon(
              icon: Icon(Icons.edit),
              label: Text('Modificar datos'),
              onPressed: () => print('IMPLEMENT BLOC'))
        ],
      ),
    );
  }
}
