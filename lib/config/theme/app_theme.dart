import 'package:flutter/material.dart';

const Color _customColor = Color.fromRGBO(160, 4, 4, 0.98);

List<Color> colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink
];

class AppTheme {
  final int selectedColor;

  AppTheme({
    required this.selectedColor 
  }):assert(selectedColor >= 0 && selectedColor < colorThemes.length, "Colors must be between 0 and ${colorThemes.length - 1}");

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorThemes[selectedColor],
      appBarTheme: const AppBarTheme(
        centerTitle: false
        )
    );
  }
}