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
            const SizedBox(height: 40),
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
                            builder: (context) =>
                                const SafetyPageEmergencyPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      fixedSize: const Size(250, 75),
                      textStyle: const TextStyle(fontSize: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
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
                                )),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(250, 75),
                      textStyle: const TextStyle(fontSize: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child: const Text('Defibrillator'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                selectedLanguage == Language.english
                    ? 'For new surfers, it is important to be aware of the safety aspects and consider the following points:'
                    : 'För nya surfare är det viktigt att vara medveten om säkerhetsaspekterna och att ta hänsyn till följande punkter:',
                textAlign: TextAlign.center,
                style:const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding:const  EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children:  selectedLanguage == Language.english
                    ? const[
                         Text(
                          '1. Learn the basics: Before venturing into the water, it is important to learn the basic surfing skills. Consider taking lessons from an experienced surf instructor who can teach you about paddling technique, board positioning, and how to catch waves.',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16),
                        ),SizedBox(height: 10),
                         Text(
                          '2. Know the area: Before paddling out, familiarize yourself with the surf spot and its conditions. Find out if there are any dangerous currents, underwater hazards, or other risks that can affect your safety.',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16),
                        ),SizedBox(height: 10),
                        Text(
                          '3. Use the right equipment: Make sure to use an appropriate surfboard and ensure it is in good condition. Wear proper wetsuit or protective attire based on the water temperature.',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16),
                        ),SizedBox(height: 10),
                        Text(
                          '4. Respect other surfers: Be respectful to other surfers and participants in the water. Follow established surf etiquette and show consideration towards others when choosing waves and taking your turns.',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16),
                        ),SizedBox(height: 10),
                        Text(
                          '5. Learn about water safety: Knowledge of water safety is crucial. Learn to assess and handle currents, waves, and other water conditions. Be aware of dangerous situations and know how to respond if you find yourself in one.',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16),
                        ),SizedBox(height: 10),
                        Text(
                          '6. Practice falling technique: As a new surfer, you will fall many times. Learn to fall correctly to minimize the risk of injuries, such as keeping your arms in front of you and avoiding landing on your head or board.',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16),
                        ),SizedBox(height: 10),
                        Text(
                          '7. Know your physical ability: Assess your own physical fitness and swimming ability. Be realistic about your own limits and have the courage to say no if the conditions are too challenging for you.',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16),
                        ),SizedBox(height: 10),
                        Text(
                          '8. Surf with a buddy: It is always best to surf with a friend, especially if you are new. You can keep an eye on each other and provide assistance if anything happens.',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16),
                        ),SizedBox(height: 10),
                        Text(
                          '9. Listen to experienced surfers: Take advice and tips from more experienced surfers. They can provide valuable insights and advice to help improve your surfing skills and safety.',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16),
                        ),SizedBox(height: 10),
                        Text(
                          '10. Respect the ocean: Remember that the ocean is a powerful force of nature. Respect its powers and be aware that conditions can change rapidly. Do not take unnecessary risks and refrain from surfing if the conditions are too dangerous or challenging.',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16),
                        ),
                      ]
                    : const [
                        Text(
                          '1. Lär dig grunderna: Innan du ger dig ut i vattnet är det viktigt att lära dig de grundläggande surffärdigheterna. Ta gärna lektioner av en erfaren surfinstruktör som kan lära dig om paddlingsteknik, positionering på brädan och hur du tar dig upp på vågorna.',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16),
                        ),SizedBox(height: 10),
                        Text(
                          '2. Känn till området: Innan du paddlar ut bör du känna till surfplatsen och dess förhållanden. Ta reda på om det finns några farliga strömmar, undervattenshinder eller andra risker som kan påverka din säkerhet.',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16),
                        ),SizedBox(height: 10),
                        Text(
                          '3. Använd rätt utrustning: Se till att använda en lämplig surfbräda och att den är i gott skick. Ha på dig en lämplig våtdräkt eller skyddande klädsel beroende på vattentemperaturen.',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16),
                        ),SizedBox(height: 10),
                        Text(
                          '4. Respektera andra surfare: Var respektfull mot andra surfare och deltagare i vattnet. Följ etablerade surfregler och visa hänsyn gentemot andra när du väljer vågor och tar dina svängar.',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16),
                        ),SizedBox(height: 10),
                        Text(
                          '5. Lär dig om vattensäkerhet: Kunskap om vattensäkerhet är avgörande. Lär dig att bedöma och hantera strömmar, vågor och andra vattenförhållanden. Var medveten om farliga situationer och veta hur man reagerar om man hamnar i en sådan.',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16),
                        ),SizedBox(height: 10),
                        Text(
                          '6. Öva på fallteknik: Du kommer att falla många gånger som ny surfare. Lär dig att falla korrekt för att minimera risken för skador, till exempel genom att hålla armarna framför dig och undvika att landa på huvudet eller brädan.',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16),
                        ),SizedBox(height: 10),
                        Text(
                          '7. Känn till din fysiska förmåga: Bedöm din egen fysiska förmåga och simkunnighet. Var realistisk med dina egna gränser och våga säga nej om förhållandena är för utmanande för dig.',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16),
                        ),SizedBox(height: 10),
                        Text(
                          '8. Surfa med en vän: Det är alltid bäst att surfa tillsammans med en kompis, särskilt om du är ny. Ni kan hålla koll på varandra och hjälpa varandra om något skulle hända.',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16),
                        ),SizedBox(height: 10),
                        Text(
                          '9. Lyssna på erfarna surfare: Ta del av råd och tips från mer erfarna surfare. De kan ge dig värdefulla tips och råd som kan hjälpa dig att förbättra dina surffärdigheter och din säkerhet.',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16),
                        ),SizedBox(height: 10),
                        Text(
                          '10. Ha respekt för havet: Kom ihåg att havet är en kraftfull naturkraft. Ha respekt för dess krafter och var medveten om att förhållandena kan förändras snabbt. Ta inga onödiga risker och avstå från att surfa om förhållandena är för farliga eller utmanande.',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


