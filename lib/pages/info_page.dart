import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surfs_up/data/location_data.dart';
import 'package:surfs_up/language_provider.dart';
import 'package:surfs_up/shared/constants/custom_text_style.dart';
import 'package:surfs_up/shared/widgets/link_confirmation_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPage extends StatelessWidget {
  final Location location;

  const InfoPage({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    final selectedLanguage =
        Provider.of<LanguageProvider>(context).selectedLanguage;

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
                    selectedLanguage == Language.english
                        ? 'Address:\n${location.address}'
                        : 'Adress:\n${location.address}',
                    style: CustomTextStyle.title3,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await _showRedirectConfirmationDialog(
                          context, selectedLanguage);
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: const EdgeInsets.all(10),
                    ),
                    child: Text(selectedLanguage == Language.english
                        ? 'Open in Google Maps'
                        : 'Öppna via Google Maps'),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                selectedLanguage == Language.english
                    ? 'Seabed and Depth: \n${location.seabedEN}'
                    : 'Botten och djup: \n${location.seabedSE}',
                style: CustomTextStyle.title3,
              ),
              const SizedBox(height: 20),
              Center(
                child: Image(
                  image: AssetImage(location.infoImagePath),
                  fit: BoxFit.fitWidth,
                ),
              ),
              Text(
                  selectedLanguage == Language.english
                      ? 'Link for more depth and more information:'
                      : 'Länk för mer information:',
                  style: CustomTextStyle.title3),
              GestureDetector(
                onTap: () async {
                  String url = location.infoURL;
                  await openLinkConfirmationDialog(
                      context, url, selectedLanguage);
                },
                child: RichText(
                  text: TextSpan(
                    text: selectedLanguage == Language.english
                        ? 'Link to ${location.name} website'
                        : 'Länk till ${location.name} hemsida',
                    style: CustomTextStyle.paragraph2.copyWith(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontFamily: 'Righteous-Regular',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                selectedLanguage == Language.english
                    ? 'General Information:'
                    : 'Allmän information:',
                style: CustomTextStyle.title3,
              ),
              Text(
                selectedLanguage == Language.english
                    ? location.descriptionEN
                    : location.descriptionSE,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showRedirectConfirmationDialog(
      BuildContext context, Language language) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(language == Language.english
              ? 'Redirect Confirmation'
              : 'Bekräfta omdirigering'),
          content: Text(language == Language.english
              ? 'You will be redirected to Google Maps, are you sure?'
              : 'Du kommer att omdirigeras till Google Maps, är du säker?'),
          actions: <Widget>[
            TextButton(
              child: Text(language == Language.english ? 'No' : 'Nej',
                  style: const TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.of(context).pop(); // Stänger dialogrutan
              },
            ),
            TextButton(
              child: Text(language == Language.english ? 'Yes' : 'Ja'),
              onPressed: () async {
                Navigator.of(context).pop(); // Stänger dialogrutan

                // Öppna länken i Google Maps
                String url = location.locationURL;
                final uri = Uri.parse(url);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                } else {
                  throw 'Could not launch $url';
                }
              },
            ),
          ],
        );
      },
    );
  }
}
