import 'package:flutter/material.dart';

class QRPaciente extends StatelessWidget {
  const QRPaciente({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Código QR'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.qr_code_2,
              size: 300,
            ),
            Text('Paciente', style: Theme.of(context).textTheme.headlineMedium),
            Text(
              '{{Nombre del paciente}}',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
