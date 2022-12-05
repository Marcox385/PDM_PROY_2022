import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PacientService {
  Future<void> pacientLogin() async {
    try {
      dynamic currUser = FirebaseAuth.instance.currentUser;
      dynamic currUserID = currUser!.uid;
      CollectionReference pacients =
          FirebaseFirestore.instance.collection('pacientes');

      await pacients
          .where('uid', isEqualTo: currUserID)
          .get()
          .then((QuerySnapshot querySnapshot) async {
        if (querySnapshot.size == 0) {
          await pacients.doc(currUserID).set({
            'uid': currUserID,
            'citas': [],
            'fecha_nacimiento': DateTime.parse('2000-12-13'),
            'nombre': currUser!.displayName,
            'sexo': 'N/A',
            'telefono': '00-00'
          });

          return;
        }

        querySnapshot.docs.forEach((doc) {
          print(doc.data());
        });
      });
    } catch (e) {
      print(e);
    }
  }

  Future<String> pacientFirstName() async {
    try {
      dynamic currUser = FirebaseAuth.instance.currentUser;
      dynamic currUserID = currUser!.uid;
      CollectionReference pacients =
          FirebaseFirestore.instance.collection('pacientes');

      String pacient_name = '';

      await pacients
          .where('uid', isEqualTo: currUserID)
          .get()
          .then((QuerySnapshot querySnapshot) async {
        querySnapshot.docs.forEach((doc) {
          pacient_name = doc['nombre'].split(' ')[0];
          return;
        });
      });

      return pacient_name;
    } catch (e) {
      return '';
    }
  }

  Future<int> pacientAddCita(DateTime new_cita) async {
    await FirebaseFirestore.instance
        .collection('pacientes')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      'citas': FieldValue.arrayUnion([new_cita])
    }, SetOptions(merge: true));

    return 0;
  }

  Future<Map<String, dynamic>> pacientData() async {
    try {
      dynamic currUser = FirebaseAuth.instance.currentUser;
      dynamic currUserID = currUser!.uid;
      CollectionReference pacients =
          FirebaseFirestore.instance.collection('pacientes');

      Map<String, dynamic> pacient_data = {};

      await pacients
          .where('uid', isEqualTo: currUserID)
          .get()
          .then((QuerySnapshot querySnapshot) async {
        querySnapshot.docs.forEach((doc) {
          pacient_data['citas'] = doc['citas'];
          pacient_data['fecha_nacimiento'] = DateFormat('dd-MM-yyy')
              .format((doc['fecha_nacimiento'] as Timestamp).toDate());
          pacient_data['foto'] = doc['foto'];
          pacient_data['nombre'] = doc['nombre'];
          pacient_data['sexo'] = doc['sexo'];
          pacient_data['telefono'] = doc['telefono'];

          return;
        });
      });

      return pacient_data;
    } catch (e) {
      return {};
    }
  }

  Future<List<Map>> getPromos() async {
    try {
      CollectionReference pacients =
          FirebaseFirestore.instance.collection('promociones');

      List<Map> promoList = [];

      await pacients.get().then((QuerySnapshot querySnapshot) async {
        querySnapshot.docs.forEach((doc) {
          promoList.add(doc.data() as Map);
        });
      });

      return promoList;
    } catch (e) {
      return [];
    }
  }

  Future<dynamic> getClosestAppointment() async {
    try {
      dynamic currUser = FirebaseAuth.instance.currentUser;
      dynamic currUserID = currUser!.uid;
      CollectionReference pacients =
          FirebaseFirestore.instance.collection('pacientes');

      dynamic closest = DateTime(0);

      await pacients
          .where('uid', isEqualTo: currUserID)
          .get()
          .then((QuerySnapshot querySnapshot) async {
        querySnapshot.docs.forEach((doc) {
          print(doc['citas']);
          List<DateTime> holder = [];

          for (var i = 0; i < doc['citas'].length; i++) {
            holder.add((doc['citas'][i] as Timestamp).toDate());
          }

          holder.sort((a, b) {
            return a.compareTo(b);
          });

          DateTime now = DateTime.now();
          for (int i = 0; i < holder.length; i++) {
            if (holder[i].isAfter(now)) {
              closest = holder[i];
              return;
            }
          }

          closest = false;
        });
      });

      return closest;
    } catch (e) {
      return false;
    }
  }

  Future<List<DateTime>> getPastAppointments() async {
    try {
      dynamic currUser = FirebaseAuth.instance.currentUser;
      dynamic currUserID = currUser!.uid;
      CollectionReference pacients =
          FirebaseFirestore.instance.collection('pacientes');

      List<DateTime> past = [];

      await pacients
          .where('uid', isEqualTo: currUserID)
          .get()
          .then((QuerySnapshot querySnapshot) async {
        querySnapshot.docs.forEach((doc) {
          print(doc['citas']);
          List<DateTime> holder = [];

          for (var i = 0; i < doc['citas'].length; i++) {
            holder.add((doc['citas'][i] as Timestamp).toDate());
          }

          holder.sort((a, b) {
            return a.compareTo(b);
          });

          DateTime now = DateTime.now();
          for (int i = 0; i < holder.length; i++) {
            if (holder[i].isAfter(now)) return;
            past.add(holder[i]);
          }
        });
      });

      return past;
    } catch (e) {
      return [];
    }
  }
}
