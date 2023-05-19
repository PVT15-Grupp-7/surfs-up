import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surfs_up/data/location_data.dart';
import 'package:surfs_up/language_provider.dart';
import 'package:surfs_up/shared/constants/custom_text_style.dart';
import 'package:surfs_up/shared/widgets/language_dialog_button_widget.dart';
import 'package:surfs_up/shared/widgets/link_confirmation_dialog.dart';

class SafetyPageDefibrillatorPage extends StatelessWidget {
  final Location location;

  const SafetyPageDefibrillatorPage({Key? key, required this.location})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedLanguage =
        Provider.of<LanguageProvider>(context).selectedLanguage;

    return Scaffold(
      backgroundColor: const Color(0xFF132246),
      appBar: AppBar(
        title: Text(selectedLanguage == Language.english
            ? 'Defibrillator'
            : 'Hjärtstartare'),
        actions: const [
          LanguageDialogButton(),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  location.name,
                  style: CustomTextStyle.title1,
                ),
              ),
              Image.asset(
                location.defibrillatorImagePath,
                height: 300,
                width: 400,
              ),
              const SizedBox(height: 10),
              Text(
                selectedLanguage == Language.english
                    ? 'Nearest Defibrillator in ${location.name}:\nSee link for more information'
                    : 'Närmaste hjärtstartare i ${location.name}:\nSe länken för mer information',
                style: CustomTextStyle.title3,
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () async {
                  await openLinkConfirmationDialog(
                      context, location.defibrillatorURL, selectedLanguage);
                },
                child: RichText(
                  text: TextSpan(
                    text:
                        selectedLanguage == Language.english ? 'Link' : 'Länk',
                    style: CustomTextStyle.title2.copyWith(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
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
