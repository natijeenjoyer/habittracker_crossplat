import 'package:flutter/material.dart';

void main() => runApp(Habitude());

class Habitude extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habitude Checklist',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Color(0xFFF4F4F4),
      ),
      home: HabitChecklistPage(),
    );
  }
}

class HabitChecklistPage extends StatefulWidget {
  @override
  _HabitChecklistPageState createState() => _HabitChecklistPageState();
}

class _HabitChecklistPageState extends State<HabitChecklistPage> {
  final List<String> habits = [
    'Morning Exercise',
    'Read 10 Pages',
    'Drink Water',
    'Meditation',
    'Plan Tomorrow',
    'No Sugar',
    'Stretching',
    'Gratitude Journal',
  ];

  late List<bool> isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = List<bool>.filled(habits.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Habitude Checklist'),
        centerTitle: true,
        elevation: 0,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: ListView.builder(
              itemCount: habits.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                  child: CheckboxListTile(
                    title: Text(
                      habits[index],
                      style: TextStyle(fontSize: 16),
                    ),
                    value: isChecked[index],
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked[index] = value!;
                      });
                    },
                    activeColor: Colors.indigo,
                    checkboxShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
