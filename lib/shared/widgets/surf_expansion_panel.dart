import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:surfs_up/all_pages.dart';
import 'package:surfs_up/shared/widgets/row_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SurfExpansionPage(),
    );
  }
}

class SurfExpansionPage extends StatefulWidget {
  const SurfExpansionPage({Key? key}) : super(key: key);

  @override
  _SurfExpansionPageState createState() => _SurfExpansionPageState();
}

class Item {
  Item({
    required this.headerValue,
    this.isExpanded = false,
    required this.windStrength,
    required this.windDirection,
    required this.surf,
    required this.hourItems,
  });

  String headerValue;
  bool isExpanded;
  String windStrength;
  String windDirection;
  String surf;
  List<HourItem> hourItems;
}

class HourItem {
  HourItem({
    required this.hour,
    required this.icon,
    required this.windSpeed,
    required this.windIcon,
    required this.windDirection,
    required this.surfStatus,
    required this.surfIcon,
  });

  int hour;
  IconData icon;
  String windSpeed;
  IconData windIcon;
  String windDirection;
  String surfStatus;
  IconData surfIcon;
}

class _SurfExpansionPageState extends State<SurfExpansionPage> {
  final List<Item> _items = generateItems();

  static List<Item> generateItems() {
    final now = DateTime.now();
    return [
      Item(
        headerValue: 'Today (${DateFormat('MMM d').format(now)})',
        windStrength: '10 m/s',
        windDirection: 'SE',
        surf: 'GOOD',
        hourItems: generateHourItems(),
      ),
      Item(
        headerValue:
            DateFormat('EEE, MMM d').format(now.add(const Duration(days: 1))),
        windStrength: '10 m/s',
        windDirection: 'SE',
        surf: 'GOOD',
        hourItems: generateHourItems(),
      ),
      Item(
        headerValue:
            DateFormat('EEE, MMM d').format(now.add(const Duration(days: 2))),
        windStrength: '10 m/s',
        windDirection: 'SE',
        surf: 'GOOD',
        hourItems: generateHourItems(),
      ),
      Item(
        headerValue:
            DateFormat('EEE, MMM d').format(now.add(const Duration(days: 3))),
        windStrength: '10 m/s',
        windDirection: 'SE',
        surf: 'GOOD',
        hourItems: generateHourItems(),
      ),
      Item(
        headerValue:
            DateFormat('EEE, MMM d').format(now.add(const Duration(days: 4))),
        windStrength: '10 m/s',
        windDirection: 'SE',
        surf: 'GOOD',
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
          icon: Icons.wb_sunny_outlined,
          windSpeed: '5 m/s',
          windIcon: Icons.air_outlined,
          windDirection: 'E',
          surfStatus: 'OK',
          surfIcon: Icons.waves_outlined,
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
                          const RowWidget(),
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
                                    Icon(hourItem.windIcon),
                                    Text(hourItem.windSpeed),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.arrow_right_alt_outlined),
                                    Text(hourItem.windDirection),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(hourItem.surfIcon),
                                    Text(hourItem.surfStatus),
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
