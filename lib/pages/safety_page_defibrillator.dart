import 'package:flutter/material.dart';
import 'package:surfs_up/data/location_data.dart';
import 'package:surfs_up/shared/constants/custom_text_style.dart';
import 'package:url_launcher/url_launcher.dart';

class SafetyPageDefibrillatorPage extends StatelessWidget {
  final Location location;

  const SafetyPageDefibrillatorPage({super.key, required this.location});

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  location.name,
                  style: CustomTextStyle.title1,
                ),
              ),
              Image.asset(location.defibrillatorImagePath,
                height: 300,
                width: 400,
              ),
              const SizedBox(height: 10),
              Text(
                'Nearest Defibrillator in ${location.name}:\n'
                    'See link for more information,',
                style: CustomTextStyle.title3,
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () async {
                  String url = location.defibrillatorURL;
                  final uri = Uri.parse(url);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Link',
                    style: CustomTextStyle.title2.copyWith(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
