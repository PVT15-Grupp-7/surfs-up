import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:surfs_up/all_pages.dart';
import 'package:surfs_up/shared/widgets/weather_row_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WeatherExpansionPage(),
    );
  }
}

class WeatherExpansionPage extends StatefulWidget {
  const WeatherExpansionPage({Key? key}) : super(key: key);

  @override
  _WeatherExpansionPageState createState() => _WeatherExpansionPageState();
}

class Item {
  Item({
    required this.headerValue,
    this.isExpanded = false,
    required this.temperature,
    required this.rain,
    required this.sunUpDown,
    required this.hourItems,
  });

  String headerValue;
  bool isExpanded;
  String temperature;
  String rain;
  String sunUpDown;
  List<HourItem> hourItems;
}

class HourItem {
  HourItem({
    required this.hour,
    required this.weatherIcon,
    required this.temperature,
    required this.rainIcon,
    required this.rain,
  });

  int hour;
  IconData weatherIcon;
  String temperature;
  IconData rainIcon;
  String rain;
}

class _WeatherExpansionPageState extends State<WeatherExpansionPage> {
  final List<Item> _items = generateItems();

  static List<Item> generateItems() {
    final now = DateTime.now();
    return [
      Item(
        headerValue: 'Today (${DateFormat('MMM d').format(now)})',
        temperature: '10 m/s',
        rain: 'SE',
        sunUpDown: 'GOOD',
        hourItems: generateHourItems(),
      ),
      Item(
        headerValue:
            DateFormat('EEE, MMM d').format(now.add(const Duration(days: 1))),
        temperature: '10 m/s',
        rain: 'SE',
        sunUpDown: 'GOOD',
        hourItems: generateHourItems(),
      ),
      Item(
        headerValue:
            DateFormat('EEE, MMM d').format(now.add(const Duration(days: 2))),
        temperature: '10 m/s',
        rain: 'SE',
        sunUpDown: 'GOOD',
        hourItems: generateHourItems(),
      ),
      Item(
        headerValue:
            DateFormat('EEE, MMM d').format(now.add(const Duration(days: 3))),
        temperature: '10 m/s',
        rain: 'SE',
        sunUpDown: 'GOOD',
        hourItems: generateHourItems(),
      ),
      Item(
        headerValue:
            DateFormat('EEE, MMM d').format(now.add(const Duration(days: 4))),
        temperature: '10 m/s',
        rain: 'SE',
        sunUpDown: 'GOOD',
        hourItems: generateHourItems(),
      ),
    ];
  }

  static List<HourItem> generateHourItems() {
    final List<HourItem> hourItems = [];
    final now = DateTime.now();
    for (int i = 0; i < 5; i++) {
      final hour = now.add(Duration(hours: i)).hour;
      hourItems.add(
        HourItem(
          hour: hour,
          weatherIcon: Icons.wb_sunny_outlined,
          temperature: '8',
          rainIcon: Icons.umbrella,
          rain: '0,0mm',
        ),
      );
    }
    return hourItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  _items[index].isExpanded = !isExpanded;
                });
              },
              children: _items.map((Item item) {
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: SizedBox(height: 8.0),
                );
                return ExpansionPanel(
                  canTapOnHeader: true,
                  backgroundColor: const Color.fromRGBO(69, 97, 161, 1),
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Text(
                            item.headerValue,
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          const Spacer(),
                          const WeatherRowWidget(),
                        ],
                      ),
                    );
                  },
                  body: Container(
                    decoration: BoxDecoration(
                      color: kDarkBlue,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: item.hourItems.map((HourItem hourItem) {
                        return ListTile(
                          leading: Text('${hourItem.hour}:00'),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(hourItem.weatherIcon),
                                    Text(hourItem.temperature),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(hourItem.rainIcon),
                                    Text(hourItem.rain),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  isExpanded: item.isExpanded,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
