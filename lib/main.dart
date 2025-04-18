import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_notifier.dart';
import 'pages/habit_home.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => ThemeNotifier(),
    child: const HabitudeApp(),
  ));
}

class HabitudeApp extends StatelessWidget {
  const HabitudeApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      title: 'Habitude',
      theme: themeNotifier.currentTheme,
      debugShowCheckedModeBanner: false,
      home: const HabitHomePage(),
    );
  }
}
