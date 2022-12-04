import 'package:dental385/themes.dart';
import 'package:flutter/material.dart';

class QRResults extends StatelessWidget {
  const QRResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: primaryColorPersonal,
          title: const Text('Datos del paciente'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Works!')
          ],
        )
    );
  }
}