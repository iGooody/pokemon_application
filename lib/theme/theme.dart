import 'package:flutter/material.dart';

final theme = ThemeData(
  primarySwatch: Colors.yellow,
  dividerColor: Colors.black,
  listTileTheme: const ListTileThemeData(iconColor: Colors.black),
  textTheme: TextTheme(
    bodyMedium: const TextStyle(
      fontFamily: "Times New Roman",
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),
    labelSmall: TextStyle(
      color: Colors.black.withOpacity(0.8),
      fontFamily: "Arial",
      fontWeight: FontWeight.w700,
      fontSize: 14,
    ),
  ),
);
