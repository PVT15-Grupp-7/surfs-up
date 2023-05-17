import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:surfs_up/all_pages.dart';

class InfoButtonClass extends StatelessWidget {
  const InfoButtonClass({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          backgroundColor: kSecondaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          title: const Text('Symbol descriptions'),
          content: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildSymbolRow(),
                _buildSymbolRowOne(),
                _buildSymbolRowTwo(),
                _buildSymbolRowThree(),
                _buildSymbolRowFour(),
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

  Widget _buildSymbolRow() {
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
          SizedBox(height: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text('Generally considered less than ideal surfing conditions',
                  textAlign: TextAlign.center),
              SizedBox(height: 4),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSymbolRowOne() {
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
            children: const [
              Text('Generally considered decent surfing conditions',
                  textAlign: TextAlign.center),
              SizedBox(height: 4),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSymbolRowTwo() {
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
          SizedBox(height: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text('Generally considered good surfing conditions',
                  textAlign: TextAlign.center),
              SizedBox(height: 4),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSymbolRowThree() {
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
          SizedBox(height: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text('Generally considered ideal surfing conditions',
                  textAlign: TextAlign.center),
              SizedBox(height: 4),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSymbolRowFour() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(' 7 m/s (10)'),
              SizedBox(height: 4),
              Text(
                'The value in the parentheses represents the wind gust',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 4),
            ],
          ),
        ],
      ),
    );
  }
}
