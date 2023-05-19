import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:surfs_up/all_pages.dart';
import 'package:surfs_up/language_provider.dart';

class InfoButtonClass extends StatelessWidget {
  const InfoButtonClass({super.key});

  @override
  Widget build(BuildContext context) {
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
          title: Center(
            child: Text(selectedLanguage == Language.english
                ? 'Symbol descriptions'
                : 'Symbolbeskrivningar'),
          ),
          content: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildSymbolRow(selectedLanguage),
                _buildSymbolRowOne(selectedLanguage),
                _buildSymbolRowTwo(selectedLanguage),
                _buildSymbolRowThree(selectedLanguage),
                _buildSymbolRowFour(selectedLanguage),
              ],
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
      backgroundColor: kPrimaryColor, // Replace with your desired color
      child: const Icon(Icons.question_mark),
    );
  }

  Widget _buildSymbolRow(Language language) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                CupertinoIcons.star,
              ),
              SizedBox(width: 2),
              Icon(CupertinoIcons.star),
              SizedBox(width: 2),
              Icon(CupertinoIcons.star),
            ],
          ),
          const SizedBox(height: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                  language == Language.english
                      ? 'Generally considered less than ideal surfing conditions'
                      : 'Generellt sett mindre än idealiska surfningsförhållanden',
                  textAlign: TextAlign.center),
              const SizedBox(height: 4),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSymbolRowOne(Language language) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                CupertinoIcons.star_fill,
                color: Colors.yellow,
              ),
              SizedBox(width: 2),
              Icon(CupertinoIcons.star),
              SizedBox(width: 2),
              Icon(CupertinoIcons.star),
            ],
          ),
          SizedBox(height: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                  language == Language.english
                      ? 'Generally considered decent surfing conditions'
                      : 'Generellt sett okej surfningsförhållanden',
                  textAlign: TextAlign.center),
              const SizedBox(height: 4),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSymbolRowTwo(Language language) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                CupertinoIcons.star_fill,
                color: Colors.yellow,
              ),
              SizedBox(width: 2),
              Icon(
                CupertinoIcons.star_fill,
                color: Colors.yellow,
              ),
              SizedBox(width: 2),
              Icon(CupertinoIcons.star),
            ],
          ),
          const SizedBox(height: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                  language == Language.english
                      ? 'Generally considered good surfing conditions'
                      : 'Generellt sett bra surfningsförhållanden',
                  textAlign: TextAlign.center),
              const SizedBox(height: 4),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSymbolRowThree(Language language) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                CupertinoIcons.star_fill,
                color: Colors.yellow,
              ),
              SizedBox(width: 2),
              Icon(
                CupertinoIcons.star_fill,
                color: Colors.yellow,
              ),
              SizedBox(width: 2),
              Icon(
                CupertinoIcons.star_fill,
                color: Colors.yellow,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                  language == Language.english
                      ? 'Generally considered ideal surfing conditions'
                      : 'Generellt sett idealiska surfningsförhållanden',
                  textAlign: TextAlign.center),
              const SizedBox(height: 4),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSymbolRowFour(Language language) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(' 7 m/s (10)'),
              const SizedBox(height: 4),
              Text(
                language == Language.english
                    ? 'The value in the parentheses represents the wind gust'
                    : 'Värdet inom parenteserna representerar vindbyarna',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
            ],
          ),
        ],
      ),
    );
  }
}
