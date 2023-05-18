import 'package:flutter/material.dart';
import 'package:surfs_up/shared/constants/custom_text_style.dart';
import 'package:url_launcher/url_launcher.dart';

class SafetyPageEmergencyPage extends StatefulWidget {
  const SafetyPageEmergencyPage({Key? key}) : super(key: key);

  @override
  _SafetyPageEmergencyPageState createState() => _SafetyPageEmergencyPageState();
}

class _SafetyPageEmergencyPageState extends State<SafetyPageEmergencyPage> {
  final String hlrURL = 'https://www.rodakorset.se/forsta-hjalpen/forsta-hjalpen-instruktioner/medvetslos/';

  Locale _selectedLocale = const Locale('en', 'US');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency'),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Choose Language'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.language),
                        title: const Text('English'),
                        onTap: () {
                          setState(() {
                            _selectedLocale = const Locale('en', 'US');
                          });
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.language),
                        title: const Text('Swedish'),
                        onTap: () {
                          setState(() {
                            _selectedLocale = const Locale('sv', 'SE');
                          });
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 100.0, 15.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _selectedLocale == const Locale('en', 'US')
                    ? 'If a person is unconscious, you should do the following:'
                    : 'Om en person är medvetslös, bör du göra följande:',
                style: CustomTextStyle.title2,
              ),
              const SizedBox(height: 40),
              Text(
                _selectedLocale == const Locale('en', 'US')
                    ? '1. Check for signs of life'
                    : '1. Kontrollera tecken på liv',
                style: CustomTextStyle.paragraph1,
              ),
              const SizedBox(height: 10),
              Text(
                _selectedLocale == const Locale('en', 'US')
                    ? '2. Check for breathing'
                    : '2. Kontrollera andningen',
                style: CustomTextStyle.paragraph1,
              ),
              const SizedBox(height: 10),
              Text(
                _selectedLocale == const Locale('en', 'US')
                    ? '3. Call 112 (if the person is unconscious and/or not breathing)'
                    : '3. Ring 112 (om personen är medvetslös och/eller inte andas)',
                style: CustomTextStyle.paragraph1,
              ),
              const SizedBox(height: 10),
              Text(
                _selectedLocale == const Locale('en', 'US')
                    ? '4. If the person is breathing, place them in a stable side position. If the person is NOT breathing, start CPR immediately.'
                    : '4 . Om personen andas, placera dem i en stabil sidoläge. Om personen INTE andas, påbörja omedelbart HLR.',
                     style: CustomTextStyle.paragraph1,
              ),
              const SizedBox(height: 15),
              Text(
                _selectedLocale == const Locale('en', 'US')
                    ? 'Link to additional information about unconsciousness and CPR:'
                    : 'Länk till ytterligare information om medvetslöshet och HLR:',
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
                      text: _selectedLocale == const Locale('en', 'US') ? 'Link' : 'Länk',
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
                if (await canLaunch(uri.toString())) {
                  await launch(uri.toString(), forceSafariVC: false);
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

