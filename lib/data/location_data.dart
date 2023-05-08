class Location {
  final String name;
  final String address;
  final String description;
  final String infoImagePath;
  final String seabed;
  final String defibrillatorURL;
  final String defibrillatorImagePath;

  Location(
      {required this.name,
      required this.address,
      required this.description,
      required this.infoImagePath,
      required this.seabed,
      required this.defibrillatorURL,
      required this.defibrillatorImagePath,
      });
}

final List<Location> locations = [
  Location(
    name: 'Torö',
    address: '114 92 Nynäshamn',
    description: 'The birthplace of surfing',
    infoImagePath: 'assets/images/surfs_up_logo.png',
    seabed: 'Stone',
    defibrillatorURL: 'https://www.hjartstartarregistret.se/#/30499/',
    defibrillatorImagePath: 'assets/images/defibrillatorn_torö.png',
  ),
  Location(
    name: 'Väddö',
    address: '760 40 Väddö',
    description: 'Home to some of the best surf spots in the world',
    infoImagePath: 'assets/images/surfs_up_logo.png',
    seabed: 'Sand',
    defibrillatorURL: 'https://www.hjartstartarregistret.se/#/82423/',
    defibrillatorImagePath: 'assets/images/defibrillatorn_väddö.png',
  ),
];
