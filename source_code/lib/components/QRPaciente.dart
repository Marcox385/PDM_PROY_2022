import 'package:flutter/material.dart';

class QRPaciente extends StatelessWidget {
  const QRPaciente({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 45, 155, 240),
          title: const Text('QR'),
        ),
        body: Column(
          children: [
            Container(
              height: 150,
            ),
            Icon(
              Icons.qr_code,
              size: 300,
            ),
            Text("Paciente {{nombre paciente}}")
          ],
        ));
  }
}