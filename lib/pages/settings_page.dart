
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          title: Text('Temperature Unit'),
          subtitle: Text('Celsius/Fahrenheit (Default: celsius)'),
          trailing: Switch(value: true, onChanged: (_) {}),
        ),
      )
    );
  }
}

