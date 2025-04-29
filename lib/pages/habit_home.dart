import 'package:flutter/material.dart';

class HabitHomePage extends StatefulWidget {
  const HabitHomePage({super.key});

  @override
  State<HabitHomePage> createState() => _HabitHomePageState();
}

class _HabitHomePageState extends State<HabitHomePage> {
  final List<String> habits = [];
  final List<bool> isChecked = [];
  final TextEditingController habitController = TextEditingController();
  int _selectedIndex = 0;

  final List<String> routeNames = ['/', '/about', '/settings'];

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

  void _onItemTapped(int index) {
    if (index == 0) return; // Already on Home
    Navigator.pushNamed(context, routeNames[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Habitude')),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
