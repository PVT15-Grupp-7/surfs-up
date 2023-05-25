import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surfs_up/all_pages.dart';
import 'package:surfs_up/language_provider.dart';

class ShareButtonClass extends StatelessWidget {
  const ShareButtonClass({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedLanguage =
        Provider.of<LanguageProvider>(context).selectedLanguage;

    return FloatingActionButton(
      onPressed: () => showDialog(
        context: context,
        builder: (BuildContext dialogContext) => AlertDialog(
          backgroundColor: kSecondaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          title: Text(selectedLanguage == Language.english
              ? 'Share to social media'
              : "Dela på sociala medier"),
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
                  onPressed: () => Navigator.pop(
                      context,
                      selectedLanguage == Language.english
                          ? 'Cancel'
                          : "Avbryt"),
                  child: Text(
                    selectedLanguage == Language.english ? 'Cancel' : 'Avbryt',
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      child: const Icon(Icons.ios_share),
    );
  }

  Widget _facebookSymbol(BuildContext context) {
    final selectedLanguage =
        Provider.of<LanguageProvider>(context).selectedLanguage;

    return FloatingActionButton(
      onPressed: () => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          backgroundColor: kSecondaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          title: Text(selectedLanguage == Language.english
              ? 'Share to Facebook'
              : 'Dela på Facebook'),
          content: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/screenshot.PNG'),
              ],
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () => Navigator.pop(
                        context,
                        selectedLanguage == Language.english
                            ? 'Cancel'
                            : "Avbryt"),
                    child: Text(
                      selectedLanguage == Language.english
                          ? 'Cancel'
                          : 'Avbryt',
                      style: const TextStyle(color: Colors.red),
                    )),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, 'Share');
                    Navigator.of(context).popUntil((route) => route.isFirst);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(selectedLanguage == Language.english
                            ? 'Succesfully shared to Facebook'
                            : 'Lyckad delning till Facebook'),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  child: Text(
                      selectedLanguage == Language.english ? 'Share' : 'Dela'),
                ),
              ],
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
    final selectedLanguage =
        Provider.of<LanguageProvider>(context).selectedLanguage;

    return FloatingActionButton(
      onPressed: () => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          backgroundColor: kSecondaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          title: Text(selectedLanguage == Language.english
              ? 'Share to Instagram'
              : 'Dela på Instagram'),
          content: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/screenshot.PNG'),
              ],
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () => Navigator.pop(
                        context,
                        selectedLanguage == Language.english
                            ? 'Cancel'
                            : 'Avbryt'),
                    child: Text(
                      selectedLanguage == Language.english
                          ? 'Cancel'
                          : 'Avbryt',
                      style: const TextStyle(color: Colors.red),
                    )),
                TextButton(
                  onPressed: () {
                    Navigator.pop(
                        context,
                        selectedLanguage == Language.english
                            ? 'Share'
                            : 'Dela');
                    Navigator.of(context).popUntil((route) => route.isFirst);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(selectedLanguage == Language.english
                            ? 'Succesfully shared to Instagram'
                            : 'Lyckad delning till Instagram'),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  child: Text(
                      selectedLanguage == Language.english ? 'Share' : 'Dela'),
                ),
              ],
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
    final selectedLanguage =
        Provider.of<LanguageProvider>(context).selectedLanguage;

    return FloatingActionButton(
      onPressed: () => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
            backgroundColor: kSecondaryColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            title: Text(selectedLanguage == Language.english
                ? 'Share to Snapchat'
                : 'Dela på Snapchat'),
            content: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/screenshot.PNG'),
                ],
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () => Navigator.pop(
                          context,
                          selectedLanguage == Language.english
                              ? 'Cancel'
                              : 'Avbryt'),
                      child: Text(
                        selectedLanguage == Language.english
                            ? 'Cancel'
                            : 'Avbryt',
                        style: const TextStyle(color: Colors.red),
                      )),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context,
                          selectedLanguage == Language ? 'Share' : 'Dela');
                      Navigator.of(context).popUntil((route) => route.isFirst);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(selectedLanguage == Language.english
                              ? 'Succesfully shared to Snapchat'
                              : 'Lyckad delning till Snapchat'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                    child: Text(selectedLanguage == Language.english
                        ? 'Share'
                        : 'Dela'),
                  ),
                ],
              ),
            ]),
      ),
      backgroundColor: Colors.yellow,
      child: const CircleAvatar(
        radius: 34,
        backgroundImage: AssetImage('assets/images/snapchat.png'),
      ),
    );
  }

  Widget _whatsappSymbol(BuildContext context) {
    final selectedLanguage =
        Provider.of<LanguageProvider>(context).selectedLanguage;

    return FloatingActionButton(
      onPressed: () => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          backgroundColor: kSecondaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          title: Text(selectedLanguage == Language.english
              ? 'Share to WhatsApp'
              : 'Dela på WhatsApp'),
          content: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/screenshot.PNG'),
              ],
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () => Navigator.pop(
                        context,
                        selectedLanguage == Language.english
                            ? 'Cancel'
                            : 'Avbryt'),
                    child: Text(
                      selectedLanguage == Language.english
                          ? 'Cancel'
                          : 'Avbryt',
                      style: const TextStyle(color: Colors.red),
                    )),
                TextButton(
                  onPressed: () {
                    Navigator.pop(
                        context,
                        selectedLanguage == Language.english
                            ? 'Share'
                            : 'Dela');
                    Navigator.of(context).popUntil((route) => route.isFirst);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(selectedLanguage == Language.english
                            ? 'Succesfully shared to WhatsApp'
                            : 'Lyckad delning till WhatsApp'),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  child: Text(
                      selectedLanguage == Language.english ? 'Share' : 'Dela'),
                ),
              ],
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
