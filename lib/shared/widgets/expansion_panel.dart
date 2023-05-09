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
      body: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Item {
  Item({
    required this.headerValue,
    this.isExpanded = false,
    required this.windStrength,
    required this.windDirection,
    required this.surf,
  });

  String headerValue;
  bool isExpanded;
  String windStrength;
  String windDirection;
  String surf;
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Item> _items = generateItems();

  static List<Item> generateItems() {
    final now = DateTime.now();
    return [
      Item(
        headerValue: 'Today (${DateFormat('MMM d').format(now)})',
        windStrength: '10 m/s',
        windDirection: 'SE',
        surf: 'GOOD',
      ),
      Item(
        headerValue:
            DateFormat('EEE, MMM d').format(now.add(const Duration(days: 1))),
        windStrength: '10 m/s',
        windDirection: 'SE',
        surf: 'GOOD',
      ),
      Item(
        headerValue:
            DateFormat('EEE, MMM d').format(now.add(const Duration(days: 2))),
        windStrength: '10 m/s',
        windDirection: 'SE',
        surf: 'GOOD',
      ),
      Item(
        headerValue:
            DateFormat('EEE, MMM d').format(now.add(const Duration(days: 3))),
        windStrength: '10 m/s',
        windDirection: 'SE',
        surf: 'GOOD',
      ),
      Item(
        headerValue:
            DateFormat('EEE, MMM d').format(now.add(const Duration(days: 4))),
        windStrength: '10 m/s',
        windDirection: 'SE',
        surf: 'GOOD',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _items[index].isExpanded = !isExpanded;
            });
          },
          children: _items.map((Item item) {
            return ExpansionPanel(
              backgroundColor: const Color.fromRGBO(69, 97, 161, 1),
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(item.headerValue),
                );
              },
              body: Container(
                decoration: BoxDecoration(
                  color: kDarkBlue,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Text('${DateTime.now().hour}:00'),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.wb_sunny_outlined),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('5 m/s'),
                                Icon(Icons.air_outlined),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('E'),
                                Icon(Icons.arrow_right_alt_outlined),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('OK'),
                                Icon(Icons.waves_outlined),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: Text('${DateTime.now().hour}:00'),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.wb_sunny_outlined),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('5 m/s'),
                                Icon(Icons.air_outlined),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('E'),
                                Icon(Icons.arrow_right_alt_outlined),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('OK'),
                                Icon(Icons.waves_outlined),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: Text('${DateTime.now().hour}:00'),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.wb_sunny_outlined),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('5 m/s'),
                                Icon(Icons.air_outlined),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('E'),
                                Icon(Icons.arrow_right_alt_outlined),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('OK'),
                                Icon(Icons.waves_outlined),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: Text('${DateTime.now().hour}:00'),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.wb_sunny_outlined),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('5 m/s'),
                                Icon(Icons.air_outlined),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('E'),
                                Icon(Icons.arrow_right_alt_outlined),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('OK'),
                                Icon(Icons.waves_outlined),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              isExpanded: item.isExpanded,
            );
          }).toList(),
        ),
      ),
    );
  }
}
