import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color.fromARGB(255, 129, 238, 127),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide.none,
      ),
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color.fromARGB(255, 5, 71, 5)),
      bodyMedium: TextStyle(color: Color.fromARGB(255, 5, 71, 5)),
      bodySmall: TextStyle(color: Color.fromARGB(255, 5, 71, 5)),
    ),
  );
}
