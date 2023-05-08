class Location {
  final String name;
  final String address;
  final String description;
  final String imagePath;
  final String seabed;
  final String defibrillatorURL;

  Location(
      {required this.name,
      required this.address,
      required this.description,
      required this.imagePath,
      required this.seabed,
      required this.defibrillatorURL,
      });
}

final List<Location> locations = [
  Location(
    name: 'Torö',
    address: '114 92 Nynäshamn',
    description: 'The birthplace of surfing',
    imagePath: 'assets/images/surfs_up_logo.png',
    seabed: 'Stone',
    defibrillatorURL: 'https://www.hjartstartarregistret.se/#/30499/',
  ),
  Location(
    name: 'Väddö',
    address: '760 40 Väddö',
    description: 'Home to some of the best surf spots in the world',
    imagePath: 'assets/images/surfs_up_logo.png',
    seabed: 'Sand',
    defibrillatorURL: 'https://www.hjartstartarregistret.se/#/30499/',
  ),
];
