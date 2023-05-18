import 'package:flutter/material.dart';
import 'package:surfs_up/shared/constants/custom_text_style.dart';
import '../shared/constants/colors.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  static const double _textSpacing = 40.0;
  Locale _selectedLocale = const Locale('en', 'US');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        title: const Text('About Us'),
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                _selectedLocale == const Locale('en', 'US')
                    ? 'Our Team 👨‍💻'
                    : 'Vårt Team 👨‍💻',
                style: CustomTextStyle.title2,
                textAlign: TextAlign.center,
              ),
              Text(
                _selectedLocale == const Locale('en', 'US')
                    ? 'The team is a bunch of students studying at Stockholm University'
                    : 'Vårt team består av studenter som studerar vid Stockholms universitet',
                style: CustomTextStyle.paragraph1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: _textSpacing),
              Text(
                _selectedLocale == const Locale('en', 'US')
                    ? 'API Data Usage ⛅'
                    : 'Användning av API-data ⛅',
                style: CustomTextStyle.title2,
                textAlign: TextAlign.center,
              ),
              Text(
                _selectedLocale == const Locale('en', 'US')
                    ? 'The weather data is collected from SMHI and YR.no APIs'
                    : 'Väderdata hämtas från SMHI och YR.no API:er',
                style: CustomTextStyle.paragraph1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: _textSpacing),
              Text(
                _selectedLocale == const Locale('en', 'US')
                    ? 'Development History 🏛️'
                    : 'Utvecklingshistorik 🏛️',
                style: CustomTextStyle.title2,
                textAlign: TextAlign.center,
              ),
              Text(
                _selectedLocale == const Locale('en', 'US')
                    ? 'This application was created in the period March-April 2023 by nine students '
                      :  'in the PVT15 course at the Computer- and System science Stockholm University',
                       style: CustomTextStyle.paragraph1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: _textSpacing),
              Text(
                _selectedLocale == const Locale('en', 'US')
                    ? 'Privacy 🔒'
                    : 'Integritet 🔒',
                style: CustomTextStyle.title2,
                textAlign: TextAlign.center,
              ),
              Text(
                _selectedLocale == const Locale('en', 'US')
                    ? 'No personal data is being collected or used'
                    : 'Ingen personlig data samlas in eller används',
                style: CustomTextStyle.paragraph1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: _textSpacing),
              Text(
                _selectedLocale == const Locale('en', 'US')
                    ? 'Contact us\nsurfs-up@gmail.com'
                    : 'Kontakta oss\nsurfs-up@gmail.com',
                style: CustomTextStyle.title2,
                textAlign: TextAlign.center,
              ),
              Image(
                image: AssetImage('assets/images/surfs_up_logo.png'),
                height: 120,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
