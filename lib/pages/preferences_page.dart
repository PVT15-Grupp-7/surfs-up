import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surfs_up/shared/constants/colors.dart';
import 'package:surfs_up/shared/app_preferences.dart';
import 'package:surfs_up/shared/language_provider.dart';
import 'package:surfs_up/shared/constants/custom_text_style.dart';
import 'package:surfs_up/shared/widgets/language_dialog_button_widget.dart';

class PreferencesPage extends StatefulWidget {
  const PreferencesPage({super.key});

  @override
  State<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  bool toroNotification = AppPref.getLocationNotification('toroNotification')!;
  bool vaddoNotification =
      AppPref.getLocationNotification('vaddoNotification')!;
  double startValue = double.parse(AppPref.getNotificationWindValues().first);
  double endValue = double.parse(AppPref.getNotificationWindValues().last);
  bool changed = false;

  @override
  Widget build(BuildContext context) {
    final language = Provider.of<LanguageProvider>(context).selectedLanguage;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () {
          changed
              ? _showSaveConfirmationDialog(language)
              : Navigator.of(context).popUntil((route) => route.isFirst);
        }),
        centerTitle: true,
        title: Text(
            language == Language.english ? 'Preferences' : 'Inställningar'),
        actions: const [
          LanguageDialogButton(),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Text(
              language == Language.english
                  ? 'I want to recieve notifications from'
                  : 'Jag vill få notifikationer från',
              style: CustomTextStyle.paragraph1,
            ),
            const SizedBox(height: 10),
            CheckboxListTile(
              activeColor: Colors.blue,
              title: const Text(
                'Torö',
                style: CustomTextStyle.title3,
              ),
              value: toroNotification,
              onChanged: (bool? value) {
                setState(() {
                  toroNotification = value!;
                  changed = true;
                });
              },
            ),
            CheckboxListTile(
              activeColor: Colors.blue,
              title: const Text(
                'Väddö',
                style: CustomTextStyle.title3,
              ),
              value: vaddoNotification,
              onChanged: (bool? value) {
                setState(() {
                  vaddoNotification = value!;
                  changed = true;
                });
              },
            ),
            const SizedBox(height: 30),
            Text(
              language == Language.english
                  ? 'I only want notifications when the wind is'
                  : 'Jag vill bara få notifikationer när vinden är',
              style: CustomTextStyle.paragraph1,
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('$startValue m/s', style: CustomTextStyle.title3),
                Text(
                  language == Language.english ? 'to' : 'till',
                  style: CustomTextStyle.paragraph1,
                ),
                Text('$endValue m/s', style: CustomTextStyle.title3),
              ],
            ),
            const SizedBox(height: 10),
            RangeSlider(
              min: 0,
              max: 20,
              divisions: 20,
              activeColor: Colors.green,
              inactiveColor: Colors.green,
              labels: RangeLabels('$startValue', '$endValue'),
              values: RangeValues(startValue, endValue),
              onChanged: (RangeValues value) {
                setState(() {
                  changed = true;
                  startValue = value.start;
                  endValue = value.end;
                });
              },
            ),
            const Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
                onPressed: () {
                  if (changed) {
                    _showSaveConfirmationDialog(language);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            language == Language.english
                                ? 'No changes made'
                                : 'Inga ändringar gjorda',
                            textAlign: TextAlign.center),
                        backgroundColor: Colors.green,
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(language == Language.english ? 'Save' : 'Spara',
                    style: CustomTextStyle.paragraph1)),
          ],
        ),
      ),
    );
  }

  void _showSaveConfirmationDialog(Language language) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: kDarkBlue,
          title: Text(language == Language.english
              ? 'Do you want to save the changes?'
              : 'Vill du spara ändringarna?'),
          actions: <Widget>[
            TextButton(
              child: Text(language == Language.english ? 'No' : 'Nej',
                  style: const TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
            TextButton(
              child: Text(language == Language.english ? 'Yes' : 'Ja'),
              onPressed: () {
                AppPref.setNotificationWindValues(
                    [startValue.toString(), endValue.toString()]);
                AppPref.setLocationNotification(
                    'vaddoNotification', vaddoNotification);
                AppPref.setLocationNotification(
                    'toroNotification', toroNotification);
                Navigator.of(context)
                    .popUntil((route) => route.isFirst); // Stänger dialogrutan
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        language == Language.english
                            ? 'Changes saved'
                            : 'Ändringar sparade',
                        textAlign: TextAlign.center),
                    backgroundColor: Colors.green,
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
