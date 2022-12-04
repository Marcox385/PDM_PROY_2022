import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
            QrImage(
              data: "Nombre del paciente\nCarlos be wildin",
              version: QrVersions.auto,
              size: 300.0,
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
