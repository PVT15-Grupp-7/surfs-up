import 'package:flutter/material.dart';

class Location {
  final String name;
  final String address;
  final String description;
  final String infoImagePath;
  final String seabed;
  final String infoURL;
  final String defibrillatorURL;
  final String defibrillatorImagePath;
  final String locationURL;
  final String sharedPreferences;
  final double longCoordinate;
  final double latCoordinate;

  Location({
    required this.name,
    required this.address,
    required this.description,
    required this.infoImagePath,
    required this.seabed,
    required this.infoURL,
    required this.defibrillatorURL,
    required this.defibrillatorImagePath,
    required this.locationURL,
    required this.sharedPreferences,
    required this.longCoordinate,
    required this.latCoordinate,
  });

  get descriptionSwedish => null;
}

final List<Location> locations = [
  Location(
    name: 'Torö',
    address: '114 92 Nynäshamn',
    description:
        'Torö is a special place for surfers, both wind, kite, and wave surfers. It is the only place in Södertörn that delivers waves, '
        'and it can deliver big time! Kärringviken, or Torö\'s "inside," is a safe place for windsurfing with a soft and slightly shallow beach '
        'to launch from. In strong south to southwest winds, waist-high very mellow lines appear in the bay, perfect for a turn or two. '
        'The inside (called Kärringviken for those of us who don\'t want to crash on the rocky beach, alternatively Kiteviken (guess why ...)) '
        'also works on northwest winds, but there are better spots to go to then.\n\n'
        'Rocky beach is surfable on east to southeast and southwest to west winds. To get the perfect wave setup, you should wait for the low-pressure systems '
        'that usually pass with strong south winds and then turn up to southwest or even better straight west. The waves then push in significantly, '
        'resulting in really good sideshore conditions. Rocky beach has both currents and offers a shorebreak that will eat you up if you don\'t '
        'sharpen up. Torö gives and Torö takes, simply put. When the wind is too straight on the beach, you can jump in at Kärringviken and then '
        'tack around the cape and ride the front side.',
    infoImagePath: 'assets/images/toro_map.png',
    seabed: 'Stone',
    infoURL: 'https://sodertornsurf.wordpress.com/toro/',
    defibrillatorURL: 'https://www.hjartstartarregistret.se/#/30499/',
    defibrillatorImagePath: 'assets/images/defibrillatorn_torö.png',
    locationURL: 'https://goo.gl/maps/6RkroyiFBwDdANpJ6',
    sharedPreferences: 'toroData',
    longCoordinate: 17.80,
    latCoordinate: 58.80,
  ),
  Location(
    name: 'Väddö',
    address: '760 40 Väddö',
    description:
        'This elongated island is located in northern Roslagen north of Stockholm and is AWESOME for surfing! There is something for everyone here, '
        'whether you are a beginner or experienced. Väddö is one of the best places in Sweden to learn windsurfing.It is a large bay with shallow water and a sandy beach that makes it easy to get started. It is also a great place to learn wave surfing. When it blows hard from southeast to southwest, excellent waves come in, perfect for learning wave surfing. It is also a great place to learn wave surfing. When it blows hard from southeast to southwest, excellent waves come in, perfect for learning wave surfing.\n\n'
        'It is also a great place to learn wave surfing. When it blows hard from southeast to southwest, excellent waves come in, perfect for learning wave surfing. It is also a great place to learn wave surfing. When it blows hard from southeast to southwest, excellent waves come in, perfect for learning wave surfing. It is also a great place to learn wave surfing. When it blows hard from southeast to southwest, excellent waves come in, perfect for learning wave surfing. It is also a great place to learn wave surfing. When it blows hard from southeast to southwest, excellent waves come in, perfect for learning wave surfing.',
    infoImagePath: 'assets/images/vaddo_map.png',
    seabed: 'Sand',
    infoURL: 'https://www.roslagen.se/upptack-vaddo',
    defibrillatorURL: 'https://www.hjartstartarregistret.se/#/82423/',
    defibrillatorImagePath: 'assets/images/defibrillatorn_väddö.png',
    locationURL: 'https://goo.gl/maps/1eqv2iQ2VoW7pZnH8',
    sharedPreferences: 'vaddoData',
    longCoordinate: 18.88,
    latCoordinate: 59.98,
  )
];

