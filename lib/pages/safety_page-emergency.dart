import 'package:flutter/material.dart';

class SafetyPageEmergencyPage extends StatelessWidget {
  const SafetyPageEmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF132246),
      appBar: AppBar(
        title: const Text('Emergency'),
      ),
      body: Center(
        child: Column(
         
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
          Padding (padding: EdgeInsets.all(30.0)),

            Text(
              'Om en person är medvetslös ska du göra enligt följande:',
              style: TextStyle(color: Colors.white, fontSize: 30),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            Text(
              '1. Kontrollera livstecken',
              style: TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 10),
            Text(
              '2. Kontrollera andningen',
              style: TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 10),
            Text(
              '3. Ring 112 (om personen inte är meveten och eller inte andas.)',
              style: TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 10),
            Text(
              '4. Om personen andas, placera denne i stabilt sidoläge. Om personen INTE andas, påbörja HLR omgående.',
              style: TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 15),
            Text(
              'Länk till ytterligare information om medvetslöshet och HLR: Link',
              style: TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
