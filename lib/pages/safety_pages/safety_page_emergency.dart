import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surfs_up/shared/language_provider.dart';
import 'package:surfs_up/shared/constants/custom_text_style.dart';
import 'package:surfs_up/shared/widgets/language_dialog_button_widget.dart';
import 'package:surfs_up/shared/widgets/link_confirmation_dialog.dart';

class SafetyPageEmergencyPage extends StatelessWidget {
  const SafetyPageEmergencyPage({Key? key}) : super(key: key);

  final String hlrURL =
      'https://www.rodakorset.se/forsta-hjalpen/forsta-hjalpen-instruktioner/medvetslos/';

  @override
  Widget build(BuildContext context) {
    final selectedLanguage =
        Provider.of<LanguageProvider>(context).selectedLanguage;

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedLanguage == Language.english
            ? 'Emergency'
            : 'Nödsituation'),
        actions: const [
          LanguageDialogButton(),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 100.0, 15.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                selectedLanguage == Language.english
                    ? 'If a person is unconscious, you should do the following:'
                    : 'Om en person är medvetslös, bör du göra följande:',
                style: CustomTextStyle.title2,
              ),
              const SizedBox(height: 40),
              Text(
                selectedLanguage == Language.english
                    ? '1. Check for signs of life'
                    : '1. Kontrollera tecken på liv',
                style: CustomTextStyle.paragraph1,
              ),
              const SizedBox(height: 10),
              Text(
                selectedLanguage == Language.english
                    ? '2. Check for breathing'
                    : '2. Kontrollera andningen',
                style: CustomTextStyle.paragraph1,
              ),
              const SizedBox(height: 10),
              Text(
                selectedLanguage == Language.english
                    ? '3. Call 112 (if the person is unconscious and/or not breathing)'
                    : '3. Ring 112 (om personen är medvetslös och/eller inte andas)',
                style: CustomTextStyle.paragraph1,
              ),
              const SizedBox(height: 10),
              Text(
                selectedLanguage == Language.english
                    ? '4. If the person is breathing, place them in a stable side position. If the person is NOT breathing, start CPR immediately.'
                    : '4 . Om personen andas, placera dem i en stabil sidoläge. Om personen INTE andas, påbörja omedelbart HLR.',
                style: CustomTextStyle.paragraph1,
              ),
              const SizedBox(height: 15),
              Text(
                selectedLanguage == Language.english
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
                    await openLinkConfirmationDialog(
                        context, hlrURL, selectedLanguage);
                  },
                  child: RichText(
                    text: TextSpan(
                      text: selectedLanguage == Language.english
                          ? 'Link'
                          : 'Länk',
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
