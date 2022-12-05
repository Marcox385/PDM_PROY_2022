import 'package:dental385/Pages/Paciente/pacient_service.dart';
import 'package:flutter/material.dart';

class HistorialPaciente extends StatelessWidget {
  const HistorialPaciente({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: PacientService().getPastAppointments(),
        builder: ((context, data) {
          if (!data.hasData) return Center(child: CircularProgressIndicator());

          List<DateTime> past = data.data as List<DateTime>;

          if (past.length == 0)
            return Center(child: Text('No hay citas registradas'));

          return ListView.builder(
            itemCount: past.length,
            itemBuilder: ((context, index) {
              return Card(
                  child: ListTile(
                leading: Icon(Icons.watch_later, size: 50.0),
                title: Text('Cita registrada'),
                subtitle: Text(past[index].toString()),
              ));
            }),
          );
        }));
  }
}
