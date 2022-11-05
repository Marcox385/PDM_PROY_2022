/*
 * Proyecto PDM
 * IS727272 - Cordero Hernández, Marco Ricardo
 * IS727366 - Rodríguez Castro, Carlos Eduardo
 * 
 * Punto de entrada inicial para aplicación  
 */
import 'package:flutter/material.dart';
import 'themes.dart' as proyThemes;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: proyThemes.lightTheme,
      title: 'Dental385',
      home: Scaffold(appBar: AppBar(
        title: Text('Prueba'),
      ),)
    );
  }
}