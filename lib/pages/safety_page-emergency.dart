import 'package:flutter/material.dart';
import 'package:surfs_up/shared/constants/custom_text_style.dart';

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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 100.0, 15.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Om en person är medvetslös ska du göra enligt följande:',
                style: CustomTextStyle.title2,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              Text(
                '1. Kontrollera livstecken',
                style: CustomTextStyle.paragraph1,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10),
              Text(
                '2. Kontrollera andningen',
                style: CustomTextStyle.paragraph1,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10),
              Text(
                '3. Ring 112 (om personen inte är meveten och eller inte andas.)',
                style: CustomTextStyle.paragraph1,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10),
              Text(
                '4. Om personen andas, placera denne i stabilt sidoläge. Om personen INTE andas, påbörja HLR omgående.',
                style: CustomTextStyle.paragraph1,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 15),
              Text(
                'Länk till ytterligare information om medvetslöshet och HLR: Link',
                style: CustomTextStyle.paragraph1,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
