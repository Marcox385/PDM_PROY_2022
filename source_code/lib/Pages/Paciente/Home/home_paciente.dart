/*
 * Proyecto PDM
 * IS727272 - Cordero Hernández, Marco Ricardo
 * IS727366 - Rodríguez Castro, Carlos Eduardo
 * 
 * Pantalla principal con datos relevantes para citas del paciente
 */
import 'package:dental385/Pages/Paciente/QR/qr_paciente.dart';
import 'package:flutter/material.dart';

class HomePaciente extends StatelessWidget {
  const HomePaciente({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Próxima cita',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(fontWeight: FontWeight.bold)),
          SizedBox(height: 10.0),
          Text(
            '16 de Septiembre',
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
            child: Divider(
              thickness: 1.5,
            ),
          ),
          Text('Tiempo restante',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontWeight: FontWeight.bold)),
          // SizedBox(height: 15.0),
          Text(
            '{{DD}} Días\n'
            '{{HH}} Horas\n'
            '{{MM}} Minutos\n'
            '{{SS}} Segundos\n',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          // SizedBox(height: 35.0),
          IconButton(
              icon: Icon(Icons.qr_code_2),
              iconSize: 90.0,
              tooltip: 'Ver QR de la cita',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QRPaciente()));
              }),
          Text('Presione para ver QR')
        ],
      ),
    ));
  }
}
