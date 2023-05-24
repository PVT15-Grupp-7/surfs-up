import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:surfs_up/all_pages.dart';
import 'package:url_launcher/url_launcher.dart';

class InstagramButtonClass extends StatelessWidget {
  const InstagramButtonClass({super.key});

  Future<void> _launchInstagram() async {
    String contentUrl =
        'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif';
    String encodedContentUrl = Uri.encodeFull(contentUrl);

    // Check if Instagram is installed on the device
    if (await canLaunch("instagram://")) {
      await launch("instagram://camera");

      await Future.delayed(const Duration(seconds: 1));

      String storyCreationUrl =
          "instagram://story-camera?media=$encodedContentUrl";

      await launch(Uri.parse(storyCreationUrl).toString());
    } else {
      print("Instagram app not installed.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showDialog(
        context: context,
        builder: (BuildContext dialogContext) => AlertDialog(
          backgroundColor: kSecondaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          title: const Text('Share to Social Media'),
          content: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _facebookSymbol(dialogContext),
                const SizedBox(
                  width: 8.0,
                ),
                _instagramSymbol(dialogContext),
                const SizedBox(
                  width: 8.0,
                ),
                _snapchatSymbol(dialogContext),
                const SizedBox(
                  width: 8.0,
                ),
                _whatsappSymbol(dialogContext),
              ],
            ),
          ),
          actions: [
            Row(
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ],
        ),
      ).then((value) {
        if (value == 'OK') {
          _launchInstagram();
        }
      }),
      backgroundColor: Colors.white,
      child: const Icon(Icons.ios_share),
    );
  }

  Widget _facebookSymbol(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          backgroundColor: kSecondaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          title: const Text('Share to Facebook'),
          content: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xff3b5998),
      child: const CircleAvatar(
        radius: 34,
        backgroundImage: AssetImage('assets/images/facebook.png'),
      ),
    );
  }

  Widget _instagramSymbol(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          backgroundColor: kSecondaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          title: const Text('Share to Instagram'),
          content: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xff3b5998),
      child: const CircleAvatar(
        radius: 44,
        backgroundImage: AssetImage('assets/images/instagram.png'),
      ),
    );
  }

  Widget _snapchatSymbol(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          backgroundColor: kSecondaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          title: const Text('Share to Snapchat'),
          content: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.yellow,
      child: const CircleAvatar(
        radius: 34,
        backgroundImage: AssetImage('assets/images/snapchat.png'),
      ),
    );
  }

  Widget _whatsappSymbol(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          backgroundColor: kSecondaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          title: const Text('Share to WhatsApp'),
          content: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.yellow,
      child: const CircleAvatar(
        radius: 34,
        backgroundImage: AssetImage('assets/images/whatsapp.png'),
      ),
    );
  }
}
