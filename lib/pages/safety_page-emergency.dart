import 'package:flutter/material.dart';
import 'package:surfs_up/shared/constants/custom_text_style.dart';
import 'package:url_launcher/url_launcher.dart';

class SafetyPageEmergencyPage extends StatelessWidget {
  const SafetyPageEmergencyPage({super.key});

  final String hlrURL = 'https://www.rodakorset.se/forsta-hjalpen/forsta-hjalpen-instruktioner/medvetslos/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 100.0, 15.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Om en person är medvetslös ska du göra enligt följande:',
                style: CustomTextStyle.title2,
              ),
              const SizedBox(height: 40),
              const Text(
                '1. Kontrollera livstecken',
                style: CustomTextStyle.paragraph1,
              ),
              const SizedBox(height: 10),
              const Text(
                '2. Kontrollera andningen',
                style: CustomTextStyle.paragraph1,
              ),
              const SizedBox(height: 10),
              const Text(
                '3. Ring 112 (om personen inte är meveten och eller inte andas.)',
                style: CustomTextStyle.paragraph1,
              ),
              const SizedBox(height: 10),
              const Text(
                '4. Om personen andas, placera denne i stabilt sidoläge. Om personen INTE andas, påbörja HLR omgående.',
                style: CustomTextStyle.paragraph1,
              ),
              const SizedBox(height: 15),
              const Text(
                'Länk till ytterligare information om medvetslöshet och HLR:',
                style: CustomTextStyle.paragraph1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () async {
                    String url = hlrURL;
                    final uri = Uri.parse(url);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri, mode: LaunchMode.externalApplication);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Link',
                      style: CustomTextStyle.title3.copyWith(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
