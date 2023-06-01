import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surfs_up/shared/language_provider.dart';
import 'package:surfs_up/shared/constants/custom_text_style.dart';
import 'package:circle_flags/circle_flags.dart';

/// Button to open a dialog to select language.
class LanguageDialogButton extends StatelessWidget {
  const LanguageDialogButton({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedLanguage =
        Provider.of<LanguageProvider>(context).selectedLanguage;

    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: IconButton(
          icon: CircleFlag(selectedLanguage == Language.english ? 'gb' : 'se',
              size: 30),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => SimpleDialog(
                title: Text(selectedLanguage == Language.english
                    ? 'Select language'
                    : 'Välj språk'),
                children: [
                  SimpleDialogOption(
                    onPressed: () {
                      final languageProvider =
                          Provider.of<LanguageProvider>(context, listen: false);
                      languageProvider.setLanguage(Language.english);
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        CircleFlag('gb', size: 28),
                        const Text('  English',
                            style: CustomTextStyle.paragraph1),
                      ],
                    ),
                  ),
                  SimpleDialogOption(
                    onPressed: () {
                      final languageProvider =
                          Provider.of<LanguageProvider>(context, listen: false);
                      languageProvider.setLanguage(Language.swedish);
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        CircleFlag('se', size: 28),
                        const Text('  Svenska',
                            style: CustomTextStyle.paragraph1),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
