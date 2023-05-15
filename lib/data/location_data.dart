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

  Location(
      {required this.name,
      required this.address,
      required this.description,
      required this.infoImagePath,
      required this.seabed,
      required this.infoURL,
      required this.defibrillatorURL,
      required this.defibrillatorImagePath,
      required this.locationURL,
      required this.sharedPreferences
      });
}

final List<Location> locations = [
  Location(
    name: 'Torö',
    address: '114 92 Nynäshamn',
    description: 'Torö är ett speciellt ställe för surfare, både vind, kite och vågsurfare. Det är den enda platsen på Södertörn som levererar vågor, och det kan levereras med besked! Kärringviken, eller Torös ”insida”, är ett säkert ställe att vindsurfa på med en mjuk och något långgrund strand att starta från. Vid hård syd till sydväst vrider det in midjehöga väldigt mjuka linjer i viken som är perfekta för att få en sväng eller två. Insidan (som kallas för Kärringviken för oss fegisar som inte vill krascha på stenstranden, alternativt Kiteviken (gissa varför …)) fungerar även på nordvästligt, men då finns också bättre platser att köra på.\n\nStenstrand är surfbart på ost till sydost och sydväst till västligt. För att få den perfekta vågridningen ska man vänta in lågtrycken som oftast passerar med hård sydlig vind och sedan vrider upp till sydväst eller ännu bättre rak väst. Vågorna trycker då in ordentligt och det blir en riktigt bra sideshore. Stenstrand är både strömt och bjuder på ett shorebreak som äter dig ordentligt om du inte skärper dig. Torö ger och Torö tar, helt enkelt. När vinden ligger på för rakt på stranden går det att hoppa i vid Kärringviken för att sedan kryssa runt udden och köra på framsidan.',
    infoImagePath: 'assets/images/toro_map.png',
    seabed: 'Stone',
    infoURL: 'https://sodertornsurf.wordpress.com/toro/',
    defibrillatorURL: 'https://www.hjartstartarregistret.se/#/30499/',
    defibrillatorImagePath: 'assets/images/defibrillatorn_torö.png',
    locationURL: 'https://goo.gl/maps/6RkroyiFBwDdANpJ6',
    sharedPreferences: 'toroData'
  ),
  Location(
    name: 'Väddö',
    address: '760 40 Väddö',
    description: 'Denna avlånga ö ligger i norra Roslagen norr om Stockholm och är GRYM att surfa på! Här finns det något för alla, oavsett om du är nybörjare eller erfaren. Väddö är en av de bästa platserna i Sverige för att lära sig att vindsurfa på. Det är en stor vik med långgrunt vatten och en sandstrand som gör att det är lätt att komma igång. Det är också en bra plats för att lära sig att vågsurfa på. När det blåser hårt från sydost till sydväst så kommer det in riktigt bra vågor som är perfekta för att lära sig att vågsurfa på. Det är också en bra plats för att lära sig att vågsurfa på. När det blåser hårt från sydost till sydväst så kommer det in riktigt bra vågor som är perfekta för att lära sig att vågsurfa på. Det är också en bra plats för att lära sig att vågsurfa på. När det blåser hårt från sydost till sydväst så kommer det in riktigt bra vågor som är perfekta för att lära sig att vågsurfa på. Det är också en bra plats för att lära sig att vågsurfa på. När det blåser hårt från sydost till sydväst så kommer det in riktigt bra vågor som är perfekta för att lära sig att vågsurfa på. Det är också en bra plats för att lära sig att vågsurfa på. När det blåser hårt från sydost till sydväst så kommer det in riktigt bra vågor som är perfekta för att lära sig att vågsurfa på.',
    infoImagePath: 'assets/images/vaddo_map.png',
    seabed: 'Sand',
    infoURL: 'https://www.roslagen.se/upptack-vaddo',
    defibrillatorURL: 'https://www.hjartstartarregistret.se/#/82423/',
    defibrillatorImagePath: 'assets/images/defibrillatorn_väddö.png',
    locationURL: 'https://goo.gl/maps/1eqv2iQ2VoW7pZnH8',
    sharedPreferences: 'vaddoData'
  ),
];
