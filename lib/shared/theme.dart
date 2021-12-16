import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightMode() => ThemeData(
      primarySwatch: Colors.brown,
    );

ThemeData darkMode() => ThemeData(
      primarySwatch: Colors.grey,
      brightness: Brightness.dark,
    );
