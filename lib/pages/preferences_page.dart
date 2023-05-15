import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:surfs_up/all_pages.dart';
import 'package:surfs_up/shared/constants/custom_text_style.dart';

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
    return showCupertinoDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  backgroundColor: kDarkBlue,
                  elevation: 8,
                  title: const Text(
                    'Do you want to save the changes?',
                    style: CustomTextStyle.paragraph1,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: const Text(
                        'No',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text('Yes'))
                  ],
                ),
            barrierDismissible: false)
        .then((value) => value ?? false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xFF0C152D),
          title: const Text('Preferences'),
        ),
        backgroundColor: const Color(0xFF132246),
        body: Center(
            child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            const Text(
              'I want to recieve notifications from',
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
            const Text(
              'I only want notifications when the wind is',
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
                const Text(
                  'to',
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
                  _showSaveConfirmationDialog();
                  // add functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  fixedSize: const Size(100, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Save', style: CustomTextStyle.paragraph1)),
          ],
        )),
      ),
    );
  }
  void _showSaveConfirmationDialog() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Save Confirmation'),
        content: const Text('Do you want to save the changes?'),
        actions: <Widget>[
          TextButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.of(context).pop(); // Stänger dialogrutan
            },
          ),
          TextButton(
            child: const Text('Yes'),
            onPressed: () {
              Navigator.of(context).pop(); // Stänger dialogrutan
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar (
                  content:  Text('Changes saved'),
                  backgroundColor: Colors.green,
                  duration:  Duration(seconds: 2),
                ),
              );
              Navigator.of(context).pop(); // Återgår till navigation_admin.dart
            },
          ),
        ],
      );
    },
  );
}
}
