
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SafetyPageDefibrillatorPage extends StatelessWidget {
const SafetyPageDefibrillatorPage({super.key});

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: const Color(0xFF132246),
appBar: AppBar(
title: const Text('Defibrillator'),
),
body: SingleChildScrollView(
child: Padding(
padding: const EdgeInsets.all(20.0),
child: Column(
children: [
const Text(
'Torö',
style: TextStyle(color: Colors.white, fontSize: 30),
),
Image.asset(
'assets/images/defibrillatorn_torö.png',
height: 300,
width: 400,
),
const SizedBox(height: 10),
const Text(
'Nearest Defibrillator in Torö: See link for more information, ',
style: TextStyle(color: Colors.white, fontSize: 20),
textAlign: TextAlign.center,
),
GestureDetector(
onTap: () async {
const url = 'https://www.hjartstartarregistret.se/#/30499/ ';
if (await canLaunch(url)) {
await launch(url);
} else {
throw 'Could not launch $url';
}
},
child: const Text(
'Link',
style: TextStyle(color: Colors.blue, fontSize: 20),
textAlign: TextAlign.center,
),
),
const SizedBox(height: 50),
const Text(
'Väddö',
style: TextStyle(color: Colors.white, fontSize: 30),
),
Image.asset(
'assets/images/defibrillatorn_väddö.png',
height: 200,
width: 400,
),
const SizedBox(height: 10),
const Text(
'Nearest Defibrillator in Väddö: See link for more information, ',
style: TextStyle(color: Colors.white, fontSize: 20),
textAlign: TextAlign.center,
),
GestureDetector(
onTap: () async {
const url = 'https://www.hjartstartarregistret.se/#/  ';
if (await canLaunchUrl (url as Uri)) {
await launchUrl (url as Uri);
} else {
throw 'Could not launch $url';
}
},
child: const Text(
'Link',
style: TextStyle(color: Colors.blue, fontSize: 20),
textAlign: TextAlign.center,
),
),
const SizedBox(height: 50),
],
),
),
),
);
}
}