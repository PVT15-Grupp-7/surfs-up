import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class InfoButtonClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          title: const Text('Information'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSymbolRow(),
              _buildSymbolRowOne(),
              _buildSymbolRowTwo(),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue, // Replace with your desired color
      child: const Icon(Icons.question_mark),
    );
  }

  Widget _buildSymbolRow() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            CupertinoIcons.star,
          ),
          const SizedBox(width: 2),
          const Icon(CupertinoIcons.star),
          const SizedBox(width: 2),
          const Icon(CupertinoIcons.star),
          const SizedBox(width: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'title',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                  'explanation explanation explanation explanation explanation explanation explanation'),
              SizedBox(height: 4),
              Text('level'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSymbolRowOne() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            CupertinoIcons.star_fill,
          ),
          const SizedBox(width: 2),
          const Icon(CupertinoIcons.star),
          const SizedBox(width: 2),
          const Icon(CupertinoIcons.star),
          const SizedBox(width: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'title',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('explanation'),
              SizedBox(height: 4),
              Text('level'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSymbolRowTwo() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            CupertinoIcons.star_fill,
          ),
          const SizedBox(width: 2),
          const Icon(CupertinoIcons.star_fill),
          const SizedBox(width: 2),
          const Icon(CupertinoIcons.star),
          const SizedBox(width: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'title',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('explanation'),
              SizedBox(height: 4),
              Text('level'),
            ],
          ),
        ],
      ),
    );
  }
}
