import 'package:flutter/material.dart';
import 'settings_page.dart';

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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
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
