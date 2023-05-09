import 'package:flutter/material.dart';
import 'package:surfs_up/all_pages.dart';
import 'package:surfs_up/shared/constants/custom_text_style.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  static const double _textSpacing = 40.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(title: const Text('About Us')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              Text(
                'Our Team',
                style: CustomTextStyle.title2,
                textAlign: TextAlign.center,
              ),
              Text(
                'The team is a bunch of students studying at Stockholm University',
                style: CustomTextStyle.paragraph1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: _textSpacing),
              Text(
                'Our Data',
                style: CustomTextStyle.title2,
                textAlign: TextAlign.center,
              ),
              Text(
                'The weather data is collected from SMHI and YR.no APIs',
                style: CustomTextStyle.paragraph1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: _textSpacing),
              Text(
                'History',
                style: CustomTextStyle.title2,
                textAlign: TextAlign.center,
              ),
              Text(
                'This application was created in april 2023 by nine students '
                'in the PVT15 course at Stockholm University',
                style: CustomTextStyle.paragraph1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: _textSpacing),
              Text(
                'Privacy',
                style: CustomTextStyle.title2,
                textAlign: TextAlign.center,
              ),
              Text(
                'No personal data is being collected or used',
                style: CustomTextStyle.paragraph1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: _textSpacing),
              Text(
                'Contact us\nsurfs-up@gmail.com',
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
