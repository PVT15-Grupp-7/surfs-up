import 'package:flutter/material.dart';
import 'package:surfs_up/data/location_data.dart';
import 'package:surfs_up/shared/constants/custom_text_style.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPage extends StatelessWidget {
  final Location location;

  const InfoPage({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Address:\n${location.address}',
                    style: CustomTextStyle.paragraph1,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      String url = location.locationURL;
                      final uri = Uri.parse(url);
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri,
                            mode: LaunchMode.externalApplication);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: const EdgeInsets.all(10),
                    ),
                    child: const Text('Open in Google Maps'),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                'Seabed and Depth: \n\n${location.seabed}',
                style: CustomTextStyle.paragraph1,
              ),
              Center(
                child: Image(
                  image: AssetImage(location.infoImagePath),
                  fit: BoxFit.fitWidth,
                ),
              ),
              const Text('Link for more depth and more information:'),
              GestureDetector(
                onTap: () async {
                  String url = location.infoURL;
                  final uri = Uri.parse(url);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Link to website',
                    style: CustomTextStyle.paragraph2.copyWith(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontFamily: 'Righteous-Regular',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'General Information:',
                style: CustomTextStyle.title2,
              ),
              Text(
                location.description,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
