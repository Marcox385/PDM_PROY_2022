/*
 * Proyecto PDM
 * IS727272 - Cordero Hernández, Marco Ricardo
 * IS727366 - Rodríguez Castro, Carlos Eduardo
 * 
 * Punto de entrada inicial para aplicación  
 */
import 'package:dental385/Pages/Login/form_body_firebase.dart';
import 'package:dental385/Pages/Paciente/Home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'Pages/home_page.dart';
import 'themes.dart' as proyThemes;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // runApp(MultiBlocProvider(providers: [], child: MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: proyThemes.lightTheme,
        title: 'Dental385',
        home: FirebaseAuth.instance.currentUser != null
            ? HomePage()
            : FormBodyFirebase());
  }
}
