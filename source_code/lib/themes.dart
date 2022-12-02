/*
 * Proyecto PDM
 * IS727272 - Cordero Hernández, Marco Ricardo
 * IS727366 - Rodríguez Castro, Carlos Eduardo
 * 
 * Archivo para manejar los temas globales de la aplicación
 */
import 'package:flutter/material.dart';

Color primaryColorPaciente = Color.fromARGB(255, 45, 155, 240);
Color primaryColorPersonal = Color.fromARGB(255, 0, 230, 210);

AppBarTheme mainAppBarTheme =
    AppBarTheme(backgroundColor: primaryColorPaciente
    
    );

ThemeData lightTheme = ThemeData(
    appBarTheme: mainAppBarTheme,
    brightness: Brightness.light,
    primaryColor: primaryColorPaciente);

ThemeData darkTheme = ThemeData(
  appBarTheme: mainAppBarTheme,
  brightness: Brightness.dark,
  primaryColor: primaryColorPaciente,
);
