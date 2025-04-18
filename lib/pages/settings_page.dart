import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme_notifier.dart';

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
