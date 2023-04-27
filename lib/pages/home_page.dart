import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      backgroundColor: const Color(0xFF132246),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0C152D),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
       title: const Text('Surfs Up'),
        ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF0C152D),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.surfing),
            label: 'Surf',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wb_sunny),
            label: 'Weather',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Info'),
        ],
        currentIndex: 0,
        selectedItemColor: const Color(0xFF59A52C),
        unselectedItemColor: const Color(0xFF132246),
        onTap: (int index) {},
      ),
    );
  }
}
