import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surfs_up/all_pages.dart';
import 'package:surfs_up/language_provider.dart';
import 'package:surfs_up/shared/constants/custom_text_style.dart';
import 'package:surfs_up/shared/widgets/language_dialog_button_widget.dart';

class PreferencesPage extends StatefulWidget {
  const PreferencesPage({super.key});

  @override
  State<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  bool valuefirst = false;
  bool valuesecond = false;
  String firstdropdownvalue = '5 m/s';
  String seconddropdownvalue = '10 m/s';

  var items = [
    '5 m/s',
    '10 m/s',
    '15 m/s',
    '> 15 m/s',
  ];

  void checkDropdownValues() {
    if (firstdropdownvalue == '5 m/s') {
      setState(() {
        seconddropdownvalue = '10 m/s';
      });
    } else if (firstdropdownvalue == '10 m/s') {
      setState(() {
        seconddropdownvalue = '15 m/s';
      });
    } else if (firstdropdownvalue == '15 m/s') {
      setState(() {
        seconddropdownvalue = '> 15 m/s';
      });
    }
  }

  Future<bool> _onBackPressed() {
    final selectedLanguage =
        Provider.of<LanguageProvider>(context, listen: false).selectedLanguage;
    return showCupertinoDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  backgroundColor: kDarkBlue,
                  elevation: 8,
                  title: Text(
                    selectedLanguage == Language.english
                        ? 'Do you want to save the changes?'
                        : 'Vill du spara ändringarna?',
                    style: CustomTextStyle.paragraph1,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: Text(
                        selectedLanguage == Language.english ? 'No' : 'Nej',
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: Text(selectedLanguage == Language.english
                            ? 'Yes'
                            : 'Ja'))
                  ],
                ),
            barrierDismissible: false)
        .then((value) => value ?? false);
  }

  @override
  Widget build(BuildContext context) {
    final selectedLanguage =
        Provider.of<LanguageProvider>(context).selectedLanguage;

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xFF0C152D),
          title: Text(selectedLanguage == Language.english
              ? 'Preferences'
              : 'Inställningar'),
          actions: const [
            LanguageDialogButton(),
          ],
        ),
        backgroundColor: const Color(0xFF132246),
        body: Center(
            child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            Text(
              selectedLanguage == Language.english
                  ? 'I want to recieve notifications from'
                  : 'Jag vill få notifikationer från',
              style: CustomTextStyle.paragraph1,
            ),
            CheckboxListTile(
              activeColor: Colors.blue,
              title: const Text(
                'Torö',
                style: CustomTextStyle.paragraph1,
              ),
              value: valuefirst,
              onChanged: (bool? value) {
                setState(() {
                  valuefirst = value!;
                });
              },
            ),
            CheckboxListTile(
              activeColor: Colors.blue,
              title: const Text(
                'Väddö',
                style: CustomTextStyle.paragraph1,
              ),
              value: valuesecond,
              onChanged: (bool? value) {
                setState(() {
                  valuesecond = value!;
                });
              },
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Text(
              selectedLanguage == Language.english
                  ? 'I only want notifications when the wind is'
                  : 'Jag vill bara få notifikationer när vinden är',
              style: CustomTextStyle.paragraph1,
            ),
            const Padding(padding: EdgeInsets.all(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton(
                    dropdownColor: kDarkBlue,
                    value: firstdropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        firstdropdownvalue = newValue!;
                        checkDropdownValues();
                      });
                    }),
                Text(
                  selectedLanguage == Language.english ? 'to' : 'till',
                  style: CustomTextStyle.paragraph1,
                ),
                DropdownButton(
                  dropdownColor: kDarkBlue,
                  value: seconddropdownvalue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      seconddropdownvalue = newValue!;
                    });
                  },
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
                onPressed: () {
                  _showSaveConfirmationDialog(selectedLanguage);
                  // add functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  fixedSize: const Size(100, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                    selectedLanguage == Language.english ? 'Save' : 'Spara',
                    style: CustomTextStyle.paragraph1)),
          ],
        )),
      ),
    );
  }

  void _showSaveConfirmationDialog(Language language) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(language == Language.english
              ? 'Save Confirmation'
              : 'Bekräfta valet'),
          content: Text(language == Language.english
              ? 'Do you want to save the changes?'
              : 'Vill du spara ändringarna?'),
          actions: <Widget>[
            TextButton(
              child: Text(language == Language.english ? 'No' : 'Nej'),
              onPressed: () {
                Navigator.of(context).pop(); // Stänger dialogrutan
              },
            ),
            TextButton(
              child: Text(language == Language.english ? 'Yes' : 'Ja'),
              onPressed: () {
                Navigator.of(context).pop(); // Stänger dialogrutan
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(language == Language.english
                        ? 'Changes saved'
                        : 'Ändringar sparade'),
                    backgroundColor: Colors.green,
                    duration: const Duration(seconds: 2),
                  ),
                );
                Navigator.of(context)
                    .pop(); // Återgår till navigation_admin.dart
              },
            ),
          ],
        );
      },
    );
  }
}
