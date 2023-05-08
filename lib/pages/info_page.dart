import 'package:flutter/material.dart';
import 'package:surfs_up/data/location_data.dart';
import 'package:surfs_up/shared/constants/custom_text_style.dart';

class InfoPage extends StatelessWidget {
  final Location location;

  const InfoPage({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                    onPressed: () {},
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
                'Seabed and Depth: \n${location.seabed}',
                style: CustomTextStyle.paragraph1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(location.infoImagePath),
                  ),
                ],
              ),
              const Text('Link for more depth and more information:'),
              const Text('URL LINK HERE'),
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
