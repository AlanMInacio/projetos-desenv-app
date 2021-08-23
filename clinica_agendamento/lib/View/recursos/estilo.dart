import 'package:flutter/material.dart';

ThemeData estilo() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: Colors.blue,
    colorScheme: ColorScheme.light(),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.white
    ),
    
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      hoverColor: Colors.blue.shade400
    )
  );
}