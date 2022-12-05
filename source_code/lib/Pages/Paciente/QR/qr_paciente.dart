import 'package:dental385/Pages/Paciente/pacient_service.dart';
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
        body: FutureBuilder(
          future: PacientService().pacientData(),
          builder: (context, data) {
            if (!data.hasData)
              return Center(child: CircularProgressIndicator());

            var pacient_data = data.data as Map<String, dynamic>;

            if (pacient_data.length == 0)
              return Center(child: Text('No ha sido posible generar el QR'));

            return FutureBuilder(
                future: PacientService().getClosestAppointment(),
                builder: (context, data) {
                  if (!data.hasData)
                    return Center(child: CircularProgressIndicator());

                  var appointment = data.data as DateTime;

                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        QrImage(
                          data:
                              "${pacient_data['nombre']}||${appointment}||${pacient_data['fecha_nacimiento']}",
                          version: QrVersions.auto,
                          size: 300.0,
                        ),
                        Text('Paciente',
                            style: Theme.of(context).textTheme.headlineMedium),
                        Text(
                          pacient_data['nombre'],
                          style: Theme.of(context).textTheme.headlineSmall,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                });
          },
        ));
  }
}
