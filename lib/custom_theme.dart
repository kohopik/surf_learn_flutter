import 'package:flutter/material.dart';

extension CustomFontStyles on TextTheme {
  static TextStyle get selectedTab =>
      const TextStyle(fontSize: 10.0, fontWeight: FontWeight.w600);
  static TextStyle get unselectedTab =>
      const TextStyle(fontSize: 10.0, fontWeight: FontWeight.w600);

  static TextStyle get body =>
      const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400);
  static TextStyle get body1 =>
      const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w700);

  static TextStyle get largeTitle =>
      const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700);
  static TextStyle get largeTitle1 =>
      const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700);
}

extension CustomColorStyles on ColorScheme {
  static Color get moscow => const Color.fromRGBO(37, 40, 73, 1);
  static Color get london => Colors.red;
  static Color get monaco => const Color.fromRGBO(241, 241, 241, 1);
  static Color get amsterdam => const Color.fromRGBO(96, 96, 123, 1);
  static Color get washington => const Color.fromRGBO(103, 205, 0, 1);
}
