import 'dart:async';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = ColorScheme.fromSeed(seedColor: Colors.white10);
    return MaterialApp(
      title: 'Navigation demo',
      theme: ThemeData(
        colorScheme: colorScheme,
        useMaterial3: true,
        appBarTheme:
        ThemeData.from(colorScheme: colorScheme).appBarTheme.copyWith(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.background,
          centerTitle: true,
        ),
      ),

    );
  }
}


