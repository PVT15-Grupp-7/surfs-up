import 'package:flutter/material.dart';
import 'package:surfs_up/shared/language_provider.dart';
import 'package:url_launcher/url_launcher.dart';

/// Shows a dialog that asks the user to confirm if they want to open a link.
Future<void> openLinkConfirmationDialog(
    BuildContext context, String url, Language language) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(language == Language.english
            ? 'Link Confirmation'
            : 'Bekräfta länk'),
        content: Text(language == Language.english
            ? 'Are you sure you want to open the link ?'
            : 'Är du säker på att du vill öppna länken?'),
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

              final uri = Uri.parse(url);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              } else {
                throw 'Could not launch $uri';
              }
            },
          ),
        ],
      );
    },
  );
}
