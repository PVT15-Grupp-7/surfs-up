import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surfs_up/data/location_data.dart';
import 'package:surfs_up/language_provider.dart';
import 'package:surfs_up/pages/safety_page-emergency.dart';
import 'package:surfs_up/pages/safety_page_defibrillator.dart';

class SafetyPage extends StatelessWidget {
  final Location location;

  const SafetyPage({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedLanguage =
        Provider.of<LanguageProvider>(context).selectedLanguage;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 0),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SafetyPageEmergencyPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      fixedSize: const Size(405, 75),
                      textStyle: const TextStyle(fontSize: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text(
                      selectedLanguage == Language.english
                          ? 'Emergency'
                          : 'Nödsituation',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SafetyPageDefibrillatorPage(
                            location: location,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(405, 75),
                      textStyle: const TextStyle(fontSize: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text('Defibrillator'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                selectedLanguage == Language.english
                    ? '🛟 General Safety Information:'
                    : '🛟 Generell Säkerhetsinformation:',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: selectedLanguage == Language.english
                    ? const [
                        Text(
                          '1. Learn the basics',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Before venturing into the water, it is important to learn the basic surfing skills. Consider taking lessons from an experienced surf instructor who can teach you about paddling technique, board positioning, and how to catch waves.',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '2. Know the area',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Before paddling out, familiarize yourself with the surf spot and its conditions. Find out if there are any dangerous currents, underwater hazards, or other risks that can affect your safety.',
                          textAlign: TextAlign.left,
                          style:                TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '3. Use the right equipment',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Make sure to use appropriate surfboard and ensure it is in good condition. Wear proper wetsuit or protective attire based on the water temperature.',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '4. Respect other surfers',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Be respectful to other surfers and participants in the water. Follow established surf etiquette and show consideration towards others when choosing waves and taking your turns.',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '5. Learn about water safety',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Knowledge of water safety is crucial. Learn to assess and handle currents, waves, and other water conditions. Be aware of dangerous situations and know how to respond if you find yourself in one.',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '6. Practice falling technique',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'As a new surfer, you will fall many times. Learn to fall correctly to minimize the risk of injuries, such as keeping your arms in front of you and avoiding landing on your head or board.',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '7. Know your physical ability',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Assess your own physical fitness and swimming ability. Be realistic about your own limits and have the courage to say no if the conditions are too challenging for you.',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '8. Surf with a buddy',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'It is always best to surf with a friend, especially if you are new. You can keep an eye on each other and provide assistance if anything happens.',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '9. Listen to experienced surfers',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'If you are new to surfing, it is a good idea to listen to more experienced surfers. They can give you advice on how to stay safe and avoid dangerous situations.',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '10. Know what to do in an emergency',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Learn about the most common surfing injuries and how to treat them. Know how to respond in an emergency situation and how to get help if needed.',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '11. Know your limits',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Be honest with yourself about your own limits. Do not try to surf in conditions that are too challenging for you. If you are not comfortable, it is best to stay on the beach.',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '12. Have fun!',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Surfing is a fun and exciting sport. Remember to have fun and enjoy the experience, but always put safety first.',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16),
              ),
              ]:const [Text(
  '1. Lär dig grunderna',
  textAlign: TextAlign.left,
  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
),
Text(
  'Innan du ger dig ut i vattnet är det viktigt att lära dig de grundläggande surfteknikerna. Överväg att ta lektioner av en erfaren surfinstruktör som kan lära dig om paddlingsteknik, brädpositionering och hur man fångar vågor.',
  textAlign: TextAlign.left,
  style: TextStyle(fontSize: 16),
),
SizedBox(height: 10),
Text(
  '2. Känn till området',
  textAlign: TextAlign.left,
  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
),
Text(
  'Innan du ger dig ut, bekanta dig med surfplatsen och dess förhållanden. Ta reda på om det finns farliga strömmar, undervattenshinder eller andra risker som kan påverka din säkerhet.',
  textAlign: TextAlign.left,
  style: TextStyle(fontSize: 16),
),
SizedBox(height: 10),
Text(
  '3. Använd rätt utrustning',
  textAlign: TextAlign.left,
  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
),
Text(
  'Se till att använda en lämplig surfbräda och se till att den är i gott skick. Använd rätt våtdräkt eller skyddsutrustning baserat på vattentemperaturen.',
  textAlign: TextAlign.left,
  style: TextStyle(fontSize: 16),
),
SizedBox(height: 10),
Text(
  '4. Respektera andra surfare',
  textAlign: TextAlign.left,
  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
),
Text(
  'Var respektfull mot andra surfare och deltagare i vattnet. Följ etablerad surfetikett och visa hänsyn till andra när du väljer vågor och tar dina turordningar.',
  textAlign: TextAlign.left,
  style: TextStyle(fontSize: 16),
),
SizedBox(height: 10),
Text(
  '5. Lär dig om vattensäkerhet',
  textAlign: TextAlign.left,
  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
),
Text(
  'Kunskap om vattensäkerhet är avgörande. Lär dig att bedöma och hantera strömmar, vågor och andra vattenförhållanden. Var medveten om farliga situationer och vet hur du ska agera om du hamnar i en sådan.',
  textAlign: TextAlign.left,
  style: TextStyle(fontSize: 16),
),
SizedBox(height: 10),
Text(
  '6. Öva på fallteknik',
  textAlign: TextAlign.left,
  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
),
Text(
  'Som ny surfare kommer du att falla många gånger. Lär dig att falla på rätt sätt för att minimera risken för skador, till exempel genom att hålla armarna framför dig och undvika att landa på huvudet eller brädan.',
  textAlign: TextAlign.left,
  style: TextStyle(fontSize: 16),
),
SizedBox(height: 10),
Text('7. Känn till din fysiska förmåga',
  textAlign: TextAlign.left,
  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
),
Text(
  'Bedöm din egen fysiska kondition och simkunnighet. Var realistisk om dina egna gränser och ha modet att säga nej om förhållandena är för utmanande för dig.',
  textAlign: TextAlign.left,
  style: TextStyle(fontSize: 16),
),
SizedBox(height: 10),
Text(
  '8. Surfa tillsammans med en kompis',
  textAlign: TextAlign.left,
  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
),
Text(
  'Det är alltid bäst att surfa tillsammans med en vän, särskilt om du är ny. Ni kan hålla ett öga på varandra och ge hjälp om något skulle hända.',
  textAlign: TextAlign.left,
  style: TextStyle(fontSize: 16),
),
SizedBox(height: 10),
Text(
  '9. Lyssna på erfarna surfare',
  textAlign: TextAlign.left,
  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
),
Text(
  'Om du är ny inom surfing är det en bra idé att lyssna på mer erfarna surfare. De kan ge dig råd om hur du håller dig säker och undviker farliga situationer.',
  textAlign: TextAlign.left,
  style: TextStyle(fontSize: 16),
),
SizedBox(height: 10),
Text(
  '10. Känn till vad du ska göra i nödsituationer',
  textAlign: TextAlign.left,
  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
),
Text(
  'Lär dig om de vanligaste surfrelaterade skadorna och hur man behandlar dem. Veta hur man agerar i en nödsituation och hur man får hjälp om det behövs.',
  textAlign: TextAlign.left,
  style: TextStyle(fontSize: 16),
),
SizedBox(height: 10),
Text(
  '11. Känn dina gränser',
  textAlign: TextAlign.left,
  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
),
Text(
  'Var ärlig mot dig själv om dina egna gränser. Försök inte surfa under förhållanden som är för utmanande för dig. Om du inte känner dig bekväm är det bäst att stanna på stranden.',
  textAlign: TextAlign.left,
  style: TextStyle(fontSize: 16),
),
SizedBox(height: 10),
Text(
  '12. Ha kul!',
  textAlign: TextAlign.left,
  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
),
Text(
  'Surfing är en rolig och spännande sport. Kom ihåg att ha kul och njut av upplevelsen, men sätt alltid säkerheten främst.',
  textAlign: TextAlign.left,
  style: TextStyle(fontSize: 16),
),
SizedBox(height: 10),]
              ),
            ),
          ],
        ),
      ),
    );
  }
}



