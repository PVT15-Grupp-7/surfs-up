import 'package:flutter/material.dart';
import 'package:surfs_up/all_pages.dart';
import 'package:surfs_up/shared/constants/custom_text_style.dart';
import 'beginners_tips_Swedish.dart';

class BeginnersTipsPage extends StatefulWidget {
  const BeginnersTipsPage({Key? key}) : super(key: key);

  @override
  _BeginnersTipsPageState createState() => _BeginnersTipsPageState();
}

class _BeginnersTipsPageState extends State<BeginnersTipsPage> {
  static const double _textSpacing = 40.0;
  Locale _selectedLocale = const Locale('en', 'US');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        title: const Text('Tips for Beginners'),
        actions: [
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Select Language'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.language),
                        title: const Text('English'),
                        onTap: () {
                          setState(() {
                            _selectedLocale = const Locale('en', 'US');
                          });
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.language),
                        title: const Text('Svenska'),
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const BeginnersTipsPageSwedish(),
                            ),
                          );
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
                'Tips for Beginners to Surfing:',
                style: CustomTextStyle.title2,
                textAlign: TextAlign.center,
              ),
              Text(
                'As a beginner in surfing, here are some important things to keep in mind to get a good start:',
                style: CustomTextStyle.paragraph1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: _textSpacing),
              Text(
                'Safety:',
                style: CustomTextStyle.title2,
                textAlign: TextAlign.center,
              ),
              Text(
                'Prioritize your own safety and others\' safety in the water. Learn about surf conditions, underwater currents, and local hazards. Always use a suitable surf leash and consider a surf guard if needed.',
                style: CustomTextStyle.paragraph1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: _textSpacing),
              Text(
                'Proper Equipment:',
                style: CustomTextStyle.title2,
                textAlign: TextAlign.center,
              ),
              Text(
                'Start with a larger and more stable surfboard, often called a "longboard" or "mini-mal." Use a suitable wetsuit and surf wax to improve grip on the board.',
                style: CustomTextStyle.paragraph1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: _textSpacing),
              Text(
                'Basic Technique:',
                style: CustomTextStyle.title2,
                textAlign: TextAlign.center,
              ),
              Text(
                  'Learn the proper paddling technique to get out to the waves. Practice standing up on the board in shallow water before venturing into waves. Keep your gaze forward and use your arms and legs to balance.',
                  style: CustomTextStyle.paragraph1,
                  textAlign: TextAlign.center),
              Text(
                'Respect for Other Surfers:',
                style: CustomTextStyle.title2,
                textAlign: TextAlign.center,
              ),
              Text(
                'Follow the rules of water traffic, give priority to those already riding a wave, and avoid collisions with other surfers.',
                style: CustomTextStyle.paragraph1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: _textSpacing),
              Text(
                'Physical Conditioning:',
                style: CustomTextStyle.title2,
                textAlign: TextAlign.center,
              ),
              Text(
                'Be in good physical shape by exercising regularly and stretching to avoid injuries.',
                style: CustomTextStyle.paragraph1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: _textSpacing),
              Text(
                'Patience:',
                style: CustomTextStyle.title2,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: _textSpacing),
              Text(
                'Have realistic expectations and be patient. Becoming a skilled surfer takes time and practice.',
                style: CustomTextStyle.paragraph1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: _textSpacing),
              Text(
                'By keeping these points in mind and gaining the right education and experience, you as a beginner will be well-prepared to enjoy the exciting world of surfing.',
                style: CustomTextStyle.paragraph1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: _textSpacing),
              Text(
                'Contact us at \nsurfs-up@gmail.com',
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
