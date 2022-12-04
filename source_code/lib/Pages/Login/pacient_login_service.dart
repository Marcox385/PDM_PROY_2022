import 'package:dental385/Pages/Login/login_page.dart';
import 'package:dental385/Pages/Paciente/Home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          print('FELIX');
          if (snapshot.hasData) {
            CollectionReference pacients =
                FirebaseFirestore.instance.collection('pacientes');

            pacients
                .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                .get()
                .then((QuerySnapshot querySnapshot) {
              querySnapshot.docs.forEach((doc) {
                print(doc);
                var currUser = doc['uid'];

                if (currUser == null) {
                  pacients.doc(FirebaseAuth.instance.currentUser!.uid).set({
                    'uid': FirebaseAuth.instance.currentUser!.uid,
                    'citas': {},
                    'fecha_nacimiento': DateTime.parse('2000-12-13'),
                    'imagen_perfil':
                        'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png',
                    'nombre': 'Nombre del paciente',
                    'sexo': 'N/A',
                    'telefono': '00-00'
                  });

                  return;
                }
              });
            });
            return HomePage();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Error al loguearse, intenta de nuevo...'),
              duration: Duration(milliseconds: 5000),
              action: SnackBarAction(
                label: 'OK',
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
              ),
            ));

            return LoginPage();
          }
        });
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
