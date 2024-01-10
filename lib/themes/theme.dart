import 'package:flutter/material.dart';

ThemeData lightModeTheme = ThemeData(
  fontFamily: 'Nunito',
  useMaterial3: true,
  primarySwatch: Colors.blueGrey,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.blueGrey,
    errorColor: Colors.red,
    backgroundColor: Colors.white,
    cardColor: Colors.white,
    brightness: Brightness.light,
  ),
  scaffoldBackgroundColor: Colors.grey[100],
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    showSelectedLabels: true,
    showUnselectedLabels: false,
    elevation: 20,
    selectedItemColor: Colors.blueGrey[800],
    unselectedItemColor: Colors.blueGrey[300],
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      iconColor: MaterialStateColor.resolveWith((states) => Colors.white),
    ),
  ),
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateColor.resolveWith((states) => Colors.blueGrey),
    trackColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
    trackOutlineColor:
        MaterialStateColor.resolveWith((states) => Colors.blueGrey),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide(
        width: 4,
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: Colors.blueGrey,
      foregroundColor: Colors.white,
      minimumSize: const Size(327, 60),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    ),
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    color: Colors.blueGrey,
    titleTextStyle: TextStyle(
      fontFamily: 'Nunito',
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
  dataTableTheme: DataTableThemeData(
    headingRowColor:
        MaterialStateColor.resolveWith((states) => Colors.blueGrey),
    headingTextStyle: const TextStyle(
      color: Colors.white,
    ),
  ),
);
