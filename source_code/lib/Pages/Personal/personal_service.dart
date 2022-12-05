import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PersonalService {
  Future<List> personalGetAllCitas() async {
    List citas = [];

    dynamic currUser = FirebaseAuth.instance.currentUser;
    dynamic currUserID = currUser!.uid;
    CollectionReference pacients =
        FirebaseFirestore.instance.collection('pacientes');

    await pacients.get().then((QuerySnapshot querySnapshot) async {
      querySnapshot.docs.forEach((doc) {
        citas.add(doc['citas']);
        return;
      });
    });

    return citas;
  }

  Future<List> personalGetAllCitasParsed() async {
    List allCitas = [];
    allCitas = await personalGetAllCitas();
    List parsedCitas = [];
    for (int i = 0; i < allCitas.length; i++) {
      for (int j = 0; j < allCitas[i].length; j++) {
        parsedCitas.add(allCitas[i][j].toDate());
      }
    }
    return parsedCitas;
  }

  Future<List> personalGetCitasToday() async {
    List allCitas = await personalGetAllCitas();
    List citasToday = [];
    for (int i = 0; i < allCitas.length; i++) {
      for (int j = 0; j < allCitas[i].length; j++) {
        DateTime cita = allCitas[i][j].toDate();
        DateTime now = DateTime.now();
        if (cita.year == now.year &&
            cita.month == now.month &&
            cita.day == now.day) {
          citasToday.add(cita);
        }
      }
    }
    return citasToday;
  }
}
