import 'package:flutter/material.dart';

class SafetyPage extends StatefulWidget {
  const SafetyPage({Key? key}) : super(key: key);

  @override
  _SafetyPageState createState() => _SafetyPageState();
}

class _SafetyPageState extends State<SafetyPage> {
  // Variabel för att hålla koll på vilket menyval som är valt i DropdownButton
  String _selectedItem = 'Torö';

  // Lista med DropdownMenuItem-widgets som används i DropdownButton
  List<DropdownMenuItem<String>> _dropdownMenuItems = [
    DropdownMenuItem(child: Text('Torö'), value: 'Torö'), 
    DropdownMenuItem(child: Text('Väddö'), value: 'Väddö'),
  ]; 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF132246),
      body: Column(
        // MainAxisAlignment.start placerar innehållet längst upp på skärmen
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Padding-widget för att lägga till vertikalt mellanrum från toppen av skärmen
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: DropdownButton<String>(
              value: _selectedItem,
              style: TextStyle(color: Colors.white, fontSize: 40),
              items: _dropdownMenuItems,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedItem = newValue!;
                });
              },
            ),
          ),
          // Expanded-widget används för att placera knapparna i mitten av den återstående skärmytan
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Första knappen (Knapp 1)
                  ElevatedButton(
                    onPressed: () {
                      // Lägg till funktionalitet här
                    }, style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      fixedSize: Size(250, 75),
                      textStyle: TextStyle(fontSize: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ), 
                    

                    ),
                    child: Text('Emergency', style: TextStyle(color: Colors.white),) 
                  ),
                  // Lägger till ett horisontellt mellanrum mellan knapparna
                  SizedBox(height: 15),
                  // Andra knappen (Knapp 2)
                  ElevatedButton(
                    onPressed: () {
                      // Lägg till funktionalitet här
                    }, style: ElevatedButton.styleFrom(
                       fixedSize: Size(250, 75),
                       textStyle: TextStyle(fontSize: 30),
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ), 
                    ),
                    child: Text('Defibrillator'),
                    
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
