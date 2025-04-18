import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/habit_model.dart';

class HabitChecklistPage extends StatelessWidget {
  const HabitChecklistPage({super.key});

  @override
  Widget build(BuildContext context) {
    final habitModel = Provider.of<HabitModel>(context);

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: habitModel.habits.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 6),
          child: CheckboxListTile(
            title: Text(habitModel.habits[index]),
            value: habitModel.checks[index],
            onChanged: (value) {
              habitModel.toggleCheck(index, value ?? false);
            },
          ),
        );
      },
    );
  }
}
