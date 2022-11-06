import 'package:flutter/material.dart';

class QRPaciente extends StatelessWidget {
  const QRPaciente({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
        );
  }
}