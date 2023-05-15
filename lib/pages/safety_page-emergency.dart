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
                'If a person is unconscious, you should do the following:',
                style: CustomTextStyle.title2,
              ),
              const SizedBox(height: 40),
              const Text(
                '1. Check for signs of life',
                style: CustomTextStyle.paragraph1,
              ),
              const SizedBox(height: 10),
              const Text(
                '2. Check for breathing',
                style: CustomTextStyle.paragraph1,
              ),
              const SizedBox(height: 10),
              const Text(
                '3. Call 112 (if the person is unconscious and/or not breathing)',
                style: CustomTextStyle.paragraph1,
              ),
              const SizedBox(height: 10),
              const Text(
                '4. If the person is breathing, place them in a stable side position. If the person is NOT breathing, start CPR immediately.',
                style: CustomTextStyle.paragraph1,
              ),
              const SizedBox(height: 15),
              const Text(
                'Link to additional information about unconsciousness and CPR:',
                style: CustomTextStyle.paragraph1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () async {
                    await _showOpenLinkConfirmationDialog(context, hlrURL);
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
  Future<void> _showOpenLinkConfirmationDialog(BuildContext context, String url) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Link Confirmation'),
          content: const Text('Are you sure you want to open the link?'),
          actions: <Widget>[
            TextButton(
              child: const Text('No', style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.of(context).pop(); // Stänger dialogrutan
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () async {
                Navigator.of(context).pop(); // Stänger dialogrutan

                final uri = Uri.parse(url);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                } else {
                  throw 'Could not launch $uri';
                }
              },
            ),
          ],
        );
      },
    );
  }
}
