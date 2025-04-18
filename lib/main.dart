import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

// Theme Management
enum AppTheme { Light, Dark, Custom }

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = ThemeData.light();
  AppTheme _currentAppTheme = AppTheme.Light;

  ThemeData get currentTheme => _currentTheme;
  AppTheme get currentAppTheme => _currentAppTheme;

  void setTheme(AppTheme theme) {
    switch (theme) {
      case AppTheme.Light:
        _currentTheme = ThemeData.light();
        break;
      case AppTheme.Dark:
        _currentTheme = ThemeData.dark();
        break;
      case AppTheme.Custom:
        _currentTheme = ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.teal,
          scaffoldBackgroundColor: const Color(0xFFEFEFEF),
        );
        break;
    }
    _currentAppTheme = theme;
    notifyListeners();
  }
}

// Home Page
class HabitHomePage extends StatefulWidget {
  const HabitHomePage({super.key});

  @override
  State<HabitHomePage> createState() => _HabitHomePageState();
}

class _HabitHomePageState extends State<HabitHomePage> {
  final List<String> habits = [];
  final List<bool> isChecked = [];
  final TextEditingController habitController = TextEditingController();

  void _addHabit() {
    final habit = habitController.text.trim();
    if (habit.isNotEmpty) {
      setState(() {
        habits.add(habit);
        isChecked.add(false);
        habitController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Habitude'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingsPage()),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: habitController,
                    decoration: const InputDecoration(labelText: 'New Habit'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _addHabit,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: habits.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(habits[index]),
                    value: isChecked[index],
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked[index] = value ?? false;
                      });
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Settings Page
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Column(
        children: [
          RadioListTile<AppTheme>(
            title: const Text('Light Theme'),
            value: AppTheme.Light,
            groupValue: themeNotifier.currentAppTheme,
            onChanged: (value) {
              if (value != null) themeNotifier.setTheme(value);
            },
          ),
          RadioListTile<AppTheme>(
            title: const Text('Dark Theme'),
            value: AppTheme.Dark,
            groupValue: themeNotifier.currentAppTheme,
            onChanged: (value) {
              if (value != null) themeNotifier.setTheme(value);
            },
          ),
          RadioListTile<AppTheme>(
            title: const Text('Custom Theme'),
            value: AppTheme.Custom,
            groupValue: themeNotifier.currentAppTheme,
            onChanged: (value) {
              if (value != null) themeNotifier.setTheme(value);
            },
          ),
        ],
      ),
    );
  }
}
