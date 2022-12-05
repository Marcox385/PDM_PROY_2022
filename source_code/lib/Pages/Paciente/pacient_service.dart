import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
        .set({'citas': FieldValue.arrayUnion([new_cita])
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
          pacient_data['fecha_nacimiento'] = doc['fecha_nacimiento'];
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

  signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }
}
