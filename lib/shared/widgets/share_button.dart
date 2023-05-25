import 'package:flutter/material.dart';
import 'package:surfs_up/all_pages.dart';

class ShareButtonClass extends StatelessWidget {
  const ShareButtonClass({super.key});

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
      ),
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
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.red),
                    )),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, 'Share');
                    Navigator.of(context).popUntil((route) => route.isFirst);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Succesfully shared to Facebook'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: const Text('Share'),
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
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.red),
                    )),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, 'Share');
                    Navigator.of(context).popUntil((route) => route.isFirst);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Succesfully shared to Instagram'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: const Text('Share'),
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
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.red),
                      )),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, 'Share');
                      Navigator.of(context).popUntil((route) => route.isFirst);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Succesfully shared to Snapchat'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    child: const Text('Share'),
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
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.red),
                    )),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, 'Share');
                    Navigator.of(context).popUntil((route) => route.isFirst);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Succesfully shared to WhatsApp'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: const Text('Share'),
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
