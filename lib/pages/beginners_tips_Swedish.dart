import 'package:flutter/material.dart';
import 'package:surfs_up/shared/constants/custom_text_style.dart';
import '../shared/constants/colors.dart';
import 'beginners_tips.dart';

class BeginnersTipsPageSwedish extends StatefulWidget {
  const BeginnersTipsPageSwedish({Key? key}) : super(key: key);

  @override
  _BeginnersTipsPageState createState() => _BeginnersTipsPageState();
}

class _BeginnersTipsPageState extends State<BeginnersTipsPageSwedish> {
  static const double _textSpacing = 40.0;
  Locale _selectedLocale = const Locale('en', 'US');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        title: const Text('Tips för nybörjare'),
        actions: [
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Välj språk'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.language),
                        title: const Text('Engelska'),
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BeginnersTipsPage(),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.language),
                        title: const Text('Svenska'),
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
            children: const [
              Text(
                'Tips för nybörjare inom surfing:',
                style: CustomTextStyle.title2,
                textAlign: TextAlign.center,
              ),
              Text(
                'Som nybörjare inom surfing finns det några viktiga saker att tänka på för att få en bra start:',
                style: CustomTextStyle.paragraph1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: _textSpacing),
              Text(
                'Säkerhet:',
                style: CustomTextStyle.title2,
                textAlign: TextAlign.center,
              ),
              Text(
                'Prioritera din egen säkerhet och andras säkerhet i vattnet. Lär dig om surfvillkor, undervattensströmmar och lokala faror. Använd alltid ett lämpligt surfbandslina och överväg en surfvakt om det behövs.',
                style: CustomTextStyle.paragraph1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: _textSpacing),
              Text(
                'Rätt utrustning:',
                style: CustomTextStyle.title2,
                textAlign: TextAlign.center,
              ),
              Text(
                'Börja med en större och stabilare surfbräda, ofta kallad "longboard" eller "mini-mal". Använd en lämplig våtdräkt och surfvax för bättre grepp på brädan.',
                style: CustomTextStyle.paragraph1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: _textSpacing),
              Text(
                'Grundläggande teknik:',
                style: CustomTextStyle.title2,
                textAlign: TextAlign.center,
              ),
              Text(
                'Lär dig rätt paddlingsteknik för att ta dig ut till vågorna. Öva på att stå upp på brädan i grunt vatten innan du vågar dig ut i vågorna. Håll blicken framåt och använd armarna och benen för att balansera.',
                style: CustomTextStyle.paragraph1,
                textAlign: TextAlign.center,
              ),
              Text(
                'Respekt för andra surfare:',
                style: CustomTextStyle.title2,
                textAlign: TextAlign.center,
              ),
              Text(
                'Följ reglerna för vattentrafik, ge företräde åt de som redan surfar på en våg och undvik kollisioner med andra surfare.',
                style: CustomTextStyle.paragraph1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: _textSpacing),
              Text(
                'Fysisk kondition:',
                style: CustomTextStyle.title2,
                textAlign: TextAlign.center,
              ),
              Text(
                'Håll dig i god fysisk form genom att träna regelbundet och stretcha för att undvika skador.',
                style: CustomTextStyle.paragraph1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: _textSpacing),
              Text(
                'Tålamod:',
                style: CustomTextStyle.title2,
                textAlign: TextAlign.center,
              ),
              Text(
                'Ha realistiska förväntningar och var tålmodig. Att bli en skicklig surfare tar tid och övning.',
                style: CustomTextStyle.paragraph1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: _textSpacing),
              Text(
                'Genom att ha dessa punkter i åtanke och skaffa rätt kunskap och erfarenhet kommer du som nybörjare att vara väl förberedd för att njuta av den spännande världen av surfing.',
                style: CustomTextStyle.paragraph1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: _textSpacing),
              Text(
                'Kontakta oss på \nsurfs-up@gmail.com',
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
