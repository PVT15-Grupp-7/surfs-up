import 'package:flutter/material.dart';

class Location {
  final String name;
  final String address;
  final String descriptionSE;
  final String descriptionEN;
  final String infoImagePath;
  final String seabedSE;
  final String seabedEN;
  final String infoURL;
  final String defibrillatorURL;
  final String defibrillatorImagePath;
  final String locationURL;
  final String sharedPreferences;
  final double longCoordinate;
  final double latCoordinate;

  Location(
      {required this.name,
      required this.address,
      required this.descriptionSE,
      required this.descriptionEN,
      required this.infoImagePath,
      required this.seabedSE,
      required this.seabedEN,
      required this.infoURL,
      required this.defibrillatorURL,
      required this.defibrillatorImagePath,
      required this.locationURL,
      required this.sharedPreferences,
      required this.longCoordinate,
      required this.latCoordinate});

  get descriptionSwedish => null;
}

final List<Location> locations = [
  Location(
    name: 'Torö',
    address: '114 92 Nynäshamn',
    descriptionSE:
        'Torö är ett speciellt ställe för surfare, både vind, kite och vågsurfare. Det är den enda platsen på Södertörn '
        'som levererar vågor, och det kan levereras med besked! Kärringviken, eller Torös ”insida”, är ett säkert ställe '
        'att vindsurfa på med en mjuk och något långgrund strand att starta från. Vid hård syd till sydväst vrider det in '
        'midjehöga väldigt mjuka linjer i viken som är perfekta för att få en sväng eller två. Insidan (som kallas för '
        'Kärringviken för oss fegisar som inte vill krascha på stenstranden, alternativt Kiteviken (gissa varför …)) '
        'fungerar även på nordvästligt, men då finns också bättre platser att köra på.\n\n'
        'Stenstrand är surfbart på ost till sydost och sydväst till västligt. För att få den perfekta vågridningen ska man '
        'vänta in lågtrycken som oftast passerar med hård sydlig vind och sedan vrider upp till sydväst eller ännu bättre '
        'rak väst. Vågorna trycker då in ordentligt och det blir en riktigt bra sideshore. Stenstrand är både strömt och '
        'bjuder på ett shorebreak som äter dig ordentligt om du inte skärper dig. Torö ger och Torö tar, helt enkelt. När '
        'vinden ligger på för rakt på stranden går det att hoppa i vid Kärringviken för att sedan kryssa runt udden och köra '
        'på framsidan.',
    descriptionEN:
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
    seabedSE: 'Sten',
    seabedEN: 'Stone',
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
    descriptionSE:
        'Väddö, en vacker och naturskön plats belägen vid Stockholms skärgård, erbjuder en fantastisk upplevelse för'
        'surfentusiaster. Med sin långa och vidsträckta kustlinje är Väddö ett populärt resmål för dem som älskar att rida '
        'vågorna.\n\nAtt surfa på Väddö innebär att ge sig ut på det öppna havet och möta de kraftfulla bränningarna. Med ett '
        'varierat utbud av surfspots kan surfare här hitta vågor som passar både nybörjare och mer erfarna åkare. Oavsett om '
        'du är ute efter höga vågor att utmana dig själv med eller mjuka och långa vågor att cruisa på, har Väddö något att '
        'erbjuda.\n\nFörutom de imponerande vågorna har Väddö också en unik och orörd natur som omger surfområdena. De omgivande '
        'skogarna och klipporna ger en lugn och avkopplande atmosfär. Det är inte ovanligt att se sälar eller havsfåglar som '
        'sällskap under din surfsession, vilket förstärker känslan av att vara i harmoni med naturen.\n\nSurfinggemenskapen på '
        'Väddö är välkomnande och passionerad. Här kan du möta likasinnade surfare och dela upplevelser och tips. Det finns'
        'även möjligheter att delta i surfskolor eller hyra utrustning om du vill testa på sporten för första gången.\n\nAtt '
        'surfa på Väddö är en chans att koppla av, njuta av naturen och utmana sig själv i vattnet. Det är en plats där '
        'surfare kan finna sin frid och känna spänningen av att erövra vågorna.',
    descriptionEN:
        'This elongated island is located in northern Roslagen north of Stockholm and is AWESOME for surfing! There is something for everyone here, '
        'whether you are a beginner or experienced. Väddö is one of the best places in Sweden to learn windsurfing.It is a large bay with shallow water '
        'and a sandy beach that makes it easy to get started. It is also a great place to learn wave surfing. When it blows hard from southeast to southwest, '
        'excellent waves come in, perfect for learning wave surfing. It is also a great place to learn wave surfing. When it blows hard from southeast to southwest, '
        'excellent waves come in, perfect for learning wave surfing.\n\n'
        'It is also a great place to learn wave surfing. When it blows hard from southeast to southwest, excellent waves come in, perfect for learning wave surfing. '
        'It is also a great place to learn wave surfing. When it blows hard from southeast to southwest, excellent waves come in, perfect for learning wave surfing. '
        'It is also a great place to learn wave surfing. When it blows hard from southeast to southwest, excellent waves come in, perfect for learning wave surfing. '
        'It is also a great place to learn wave surfing. When it blows hard from southeast to southwest, excellent waves come in, perfect for learning wave surfing.',
    infoImagePath: 'assets/images/vaddo_map.png',
    seabedSE: 'Sand',
    seabedEN: 'Sand',
    infoURL: 'https://www.roslagen.se/upptack-vaddo',
    defibrillatorURL: 'https://www.hjartstartarregistret.se/#/82423/',
    defibrillatorImagePath: 'assets/images/defibrillatorn_väddö.png',
    locationURL: 'https://goo.gl/maps/1eqv2iQ2VoW7pZnH8',
    sharedPreferences: 'vaddoData',
    longCoordinate: 18.88,
    latCoordinate: 59.98,
  )
];
