import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/habit_model.dart';

class HabitHomePage extends StatefulWidget {
  const HabitHomePage({super.key});

  @override
  State<HabitHomePage> createState() => _HabitHomePageState();
}

class _HabitHomePageState extends State<HabitHomePage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final habitModel = Provider.of<HabitModel>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(labelText: 'New Habit'),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  final text = _controller.text.trim();
                  if (text.isNotEmpty) {
                    habitModel.addHabit(text);
                    _controller.clear();
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: habitModel.habits.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  title: Text(habitModel.habits[index]),
                  value: habitModel.checks[index],
                  onChanged: (value) {
                    habitModel.toggleCheck(index, value ?? false);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
