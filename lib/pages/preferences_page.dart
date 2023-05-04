import 'package:flutter/material.dart';

class PreferencesPage extends StatefulWidget {
  const PreferencesPage({super.key});

  @override
  State<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  bool valuefirst = false;
  bool valuesecond = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0C152D),
        title: const Text('Preferences'),
      ),
      backgroundColor: const Color(0xFF132246),
      body: Center(
          child: Column(
        children: [
          const Text('I want to recieve notifications from'),
          CheckboxListTile(
            activeColor: Colors.blue,
            title: const Text('Torö'),
            value: valuefirst,
            onChanged: (bool? value) {
              setState(() {
                valuefirst = value!;
              });
            },
          ),
          CheckboxListTile(
            activeColor: Colors.blue,
            title: const Text('Väddö'),
            value: valuesecond,
            onChanged: (bool? value) {
              setState(() {
                valuesecond = value!;
              });
            },
          ),
        ],
      )),
    );
  }
}
