import 'package:flutter/material.dart';

class HabitModel extends ChangeNotifier {
  final List<String> _habits = [
    'Morning Exercise',
    'Read 10 Pages',
    'Drink Water',
    'Meditation',
  ];
  final List<bool> _checks = [];

  HabitModel() {
    _checks.addAll(List.filled(_habits.length, false));
  }

  List<String> get habits => _habits;
  List<bool> get checks => _checks;

  void addHabit(String habit) {
    _habits.add(habit);
    _checks.add(false);
    notifyListeners();
  }

  void toggleCheck(int index, bool value) {
    _checks[index] = value;
    notifyListeners();
  }
}
