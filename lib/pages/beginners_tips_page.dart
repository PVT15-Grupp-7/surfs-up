import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surfs_up/shared/language_provider.dart';
import 'package:surfs_up/shared/constants/custom_text_style.dart';
import 'package:surfs_up/shared/widgets/language_dialog_button_widget.dart';
import '../shared/constants/colors.dart';

class BeginnersTipsPage extends StatelessWidget {
  const BeginnersTipsPage({Key? key}) : super(key: key);

  static const double _textSpacing = 40.0;

  @override
  Widget build(BuildContext context) {
    final selectedLanguage =
        Provider.of<LanguageProvider>(context).selectedLanguage;

    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        title: Text(selectedLanguage == Language.english
            ? 'Tips for Beginners'
            : 'Tips för Nybörjare'),
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
                    ? 'Tips for Beginners in Surfing:'
                    : 'Tips för nybörjare inom surfing:',
                style: CustomTextStyle.title2,
                textAlign: TextAlign.center,
              ),
              Text(
                selectedLanguage == Language.english
                    ? 'As a beginner in surfing, there are a few important things to keep in mind to get a good start:'
                    : 'Som nybörjare inom surfing finns det några viktiga saker att tänka på för att få en bra start:',
                style: CustomTextStyle.paragraph1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: _textSpacing),
              Text(
                selectedLanguage == Language.english ? 'Safety:' : 'Säkerhet:',
                style: CustomTextStyle.title2,
                textAlign: TextAlign.center,
              ),
              Text(
                selectedLanguage == Language.english
                    ? 'Prioritize your own safety and the safety of others in the water. Learn about surf conditions, underwater currents, and local hazards. Always use an appropriate surf leash and consider a surf buddy if needed.'
                    : 'Prioritera din egen säkerhet och andras säkerhet i vattnet. Lär dig om surfvillkor, undervattensströmmar och lokala faror. Använd alltid ett lämpligt surfbandslina och överväg en surfvakt om det behövs.',
                style: CustomTextStyle.paragraph1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: _textSpacing),
              Text(
                selectedLanguage == Language.english
                    ? 'Proper Equipment:'
                    : 'Rätt utrustning:',
                style: CustomTextStyle.title2,
                textAlign: TextAlign.center,
              ),
              Text(
                selectedLanguage == Language.english
                    ? 'Start with a larger and more stable surfboard, often called a "longboard" or "mini-mal". Use a suitable wetsuit and surf wax for better grip on the board.'
                    : 'Börja med en större och stabilare surfbräda, ofta kallad "longboard" eller "mini-mal". Använd en lämplig våtdräkt och surfvax för bättre grepp på brädan.',
                style: CustomTextStyle.paragraph1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: _textSpacing),
              Text(
                selectedLanguage == Language.english
                    ? 'Basic Technique:'
                    : 'Grundläggande teknik:',
                style: CustomTextStyle.title2,
                textAlign: TextAlign.center,
              ),
              Text(
                selectedLanguage == Language.english
                    ? 'Learn the proper paddling technique to get out to the waves. Practice standing up on the board in shallow water before venturing into the waves. Keep your gaze forward and use your arms and legs to balance.'
                    : 'Lär dig rätt paddlingsteknik för att ta dig ut till vågorna. Öva på att stå upp på brädan i grunt vatten innan du vågar dig ut i vågorna. Håll blicken framåt och använd armarna och benen för att balansera.',
                style: CustomTextStyle.paragraph1,
                textAlign: TextAlign.center,
              ),
              Text(
                selectedLanguage == Language.english
                    ? 'Respect for Other Surfers:'
                    : 'Respekt för andra surfare:',
                style: CustomTextStyle.title2,
                textAlign: TextAlign.center,
              ),
              Text(
                selectedLanguage == Language.english
                    ? 'Follow the rules of water traffic, give priority to those already surfing a wave, and avoid collisions with other surfers.'
                    : 'Följ reglerna för vattentrafik, ge företräde åt de som redan surfar på en våg och undvik kollisioner med andra surfare.',
                style: CustomTextStyle.paragraph1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: _textSpacing),
              Text(
                selectedLanguage == Language.english
                    ? 'Physical Fitness:'
                    : 'Fysisk kondition:',
                style: CustomTextStyle.title2,
                textAlign: TextAlign.center,
              ),
              Text(
                selectedLanguage == Language.english
                    ? 'Stay in good physical shape by exercising regularly and stretching to avoid injuries.'
                    : 'Håll dig i god fysisk form genom att träna regelbundet och stretcha för att undvika skador.',
                style: CustomTextStyle.paragraph1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: _textSpacing),
              Text(
                selectedLanguage == Language.english ? 'Patience:' : 'Tålamod:',
                style: CustomTextStyle.title2,
                textAlign: TextAlign.center,
              ),
              Text(
                selectedLanguage == Language.english
                    ? 'Have realistic expectations and be patient. Becoming a skilled surfer takes time and practice.'
                    : 'Ha realistiska förväntningar och var tålmodig. Att bli en skicklig surfare tar tid och övning.',
                style: CustomTextStyle.paragraph1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: _textSpacing),
              Text(
                selectedLanguage == Language.english
                    ? 'By keeping these points in mind and gaining the right knowledge and experience, you as a beginner will be well prepared to enjoy the exciting world of surfing.'
                    : 'Genom att ha dessa punkter i åtanke och skaffa rätt kunskap och erfarenhet kommer du som nybörjare att vara väl förberedd för att njuta av den spännande världen av surfing.',
                style: CustomTextStyle.paragraph1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: _textSpacing),
              Text(
                selectedLanguage == Language.english
                    ? 'Contact us at \nsurfs-up@gmail.com'
                    : 'Kontakta oss på \nsurfs-up@gmail.com',
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
