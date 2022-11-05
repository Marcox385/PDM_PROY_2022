/*
 * Proyecto PDM
 * IS727272 - Cordero Hernández, Marco Ricardo
 * IS727366 - Rodríguez Castro, Carlos Eduardo
 * 
 * Archivo para manejar los temas globales de la aplicación
 */
import 'package:flutter/material.dart';

Color primaryColor = Color.fromARGB(255, 45, 155, 240);

AppBarTheme mainAppBarTheme = AppBarTheme(backgroundColor: primaryColor);

ThemeData lightTheme = ThemeData(
    appBarTheme: mainAppBarTheme,
    brightness: Brightness.light,
    primaryColor: primaryColor
);

ThemeData darkTheme = ThemeData(
  appBarTheme: mainAppBarTheme,
  brightness: Brightness.dark,
  primaryColor: primaryColor,
);
