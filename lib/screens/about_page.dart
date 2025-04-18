import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  final String description = '''
Habitude is a habit tracker app for maintaining daily routines with reminders and progress tracking. Built for productivity and wellness.''';

  final String credits = '''
Developed by Niyaz, Milana, and Yelzhan
Course: Crossplatform Development
Professor: Abzal Kyzyrkanov
''';

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text('App Description', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 10),
        Text(description),
        const SizedBox(height: 30),
        Text('Credits', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 10),
        Text(credits),
      ],
    );
  }
}
