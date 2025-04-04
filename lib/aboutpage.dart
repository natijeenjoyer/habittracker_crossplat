import 'package:flutter/material.dart';

void main() => runApp(HabitSyncApp());

class HabitSyncApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habitude - About',
      theme: ThemeData(
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.light(
          primary: Colors.indigoAccent,
          onPrimary: Colors.white,
        ),
        scaffoldBackgroundColor: Color(0xFFF4F4F4),
      ),
      home: AboutPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AboutPage extends StatelessWidget {
  final String description = '''
Habitude is a simple and intuitive habit tracker app designed to help users build and maintain healthy habits. Whether it's exercising, reading, or drinking more water, Habitude keeps you motivated with reminders, streaks, and visual progress tracking. The app is built for students and professionals who want to take control of their daily routines and improve productivity.
''';

  final String credits = '''
Developed by Niyaz, Milana, and Yelzhan in the scope of the course “Crossplatform Development” at Astana IT University.
Mentor: Assistant Professor Abzal Kyzyrkanov
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Habitude'),
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'App Description',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigoAccent,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Credits',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigoAccent,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    credits,
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
