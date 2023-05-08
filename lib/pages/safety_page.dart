import 'package:flutter/material.dart';
import 'package:surfs_up/data/location_data.dart';
import 'package:surfs_up/pages/safety_page-emergency.dart';
import 'package:surfs_up/pages/safety_page_defibrillator.dart';

class SafetyPage extends StatelessWidget {
  final Location location;
  const SafetyPage({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Bakgrundsfärgen på skärmen
      backgroundColor: Color(0xFF132246),
      body: Column(
        // Placera innehållet längst upp på skärmen
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Column(
                // Centrera knapparna vertikalt
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Första knappen (Nödsituation)
                  ElevatedButton(
                    // Navigera till SafetyPageEmergencyPage när knappen trycks
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const SafetyPageEmergencyPage()),
                      );
                    },
                    // Stilen på knappen
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      // Fast storlek på knappen
                      fixedSize: const Size(250, 75),
                      // Stilen på texten inuti knappen
                      textStyle: const TextStyle(fontSize: 30),
                      // Formen på knappen
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    // Texten inuti knappen
                    child: const Text(
                      'Emergency',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  // Lägg till ett horisontellt mellanrum mellan knapparna
                  const SizedBox(height: 15),
                  // Andra knappen (Defibrillator)
                  ElevatedButton(
                    // Navigera till SafetyPageDefibrillatorPage när knappen trycks
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SafetyPageDefibrillatorPage(location: location,)),
                      );
                    },
                    // Stilen på knappen
                    style: ElevatedButton.styleFrom(
                      // Fast storlek på knappen
                      fixedSize: Size(250, 75),
                      // Stilen på texten inuti knappen
                      textStyle: TextStyle(fontSize: 30),
                      // Formen på knappen
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    // Texten inuti knappen
                    child: const Text('Defibrillator'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
