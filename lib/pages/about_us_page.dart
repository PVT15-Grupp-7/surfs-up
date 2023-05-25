import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surfs_up/language_provider.dart';
import 'package:surfs_up/shared/constants/custom_text_style.dart';
import 'package:surfs_up/shared/widgets/language_dialog_button_widget.dart';
import '../shared/constants/colors.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  static const double _textSpacing = 40.0;

  @override
  Widget build(BuildContext context) {
    final selectedLanguage =
        Provider.of<LanguageProvider>(context).selectedLanguage;

    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        title:
            Text(selectedLanguage == Language.english ? 'About Us' : 'Om Oss'),
        actions: const [
          LanguageDialogButton(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                selectedLanguage == Language.english
                    ? 'Our Team 👨‍💻'
                    : 'Vårt Team 👨‍💻',
                style: CustomTextStyle.title2,
                textAlign: TextAlign.center,
              ),
              Text(
                selectedLanguage == Language.english
                    ? 'The team is a bunch of students studying at Stockholm University'
                    : 'Vårt team består av studenter som studerar vid Stockholms universitet',
                style: CustomTextStyle.paragraph1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: _textSpacing),
              Text(
                selectedLanguage == Language.english
                    ? 'API Data Usage ⛅'
                    : 'Användning av API-data ⛅',
                style: CustomTextStyle.title2,
                textAlign: TextAlign.center,
              ),
              Text(
                selectedLanguage == Language.english
                    ? 'The weather data is collected from SMHI and YR.no APIs'
                    : 'Väderdata hämtas från SMHI och YR.no API:er',
                style: CustomTextStyle.paragraph1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: _textSpacing),
              Text(
                selectedLanguage == Language.english
                    ? 'Development History 🏛️'
                    : 'Utvecklingshistorik 🏛️',
                style: CustomTextStyle.title2,
                textAlign: TextAlign.center,
              ),
              Text(
                selectedLanguage == Language.english
                    ? 'This application was created in the period March-April 2023 by nine students '
                    : 'in the PVT15 course at the Computer- and System science Stockholm University',
                style: CustomTextStyle.paragraph1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: _textSpacing),
              Text(
                selectedLanguage == Language.english
                    ? 'Privacy 🔒'
                    : 'Integritet 🔒',
                style: CustomTextStyle.title2,
                textAlign: TextAlign.center,
              ),
              Text(
                selectedLanguage == Language.english
                    ? 'No personal data is being collected or used'
                    : 'Ingen personlig data samlas in eller används',
                style: CustomTextStyle.paragraph1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: _textSpacing),
              Text(
                selectedLanguage == Language.english
                    ? 'Contact us\nsurfs-up@gmail.com'
                    : 'Kontakta oss\nsurfs-up@gmail.com',
                style: CustomTextStyle.title2,
                textAlign: TextAlign.center,
              ),
              const Image(
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
