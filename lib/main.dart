// lib/main.dart
import 'package:flutter/material.dart';
import 'app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GameState(SettingsRepository(), GameLogic())),
      ],
      child: MyApp(),
    ),
  );
}