// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:surfs_up/all_pages.dart';
// import 'package:surfs_up/shared/constants/dynamic_content.dart';
// import 'package:surfs_up/shared/widgets/row_widget.dart';
// import 'package:surfs_up/shared/widgets/weather_row_widget.dart';
//
// class WeatherExpansion extends StatefulWidget {
//   const WeatherExpansion({Key? key}) : super(key: key);
//
//   @override
//   _WeatherExpansionState createState() => _WeatherExpansionState();
// }
//
// class Hour {
//   Hour({
//     required this.hourItems,
//   });
//   List<HourItem> hourItems;
// }
//
// class HourItem {
//   HourItem({
//     required this.hour,
//     required this.icon,
//     required this.windSpeed,
//     required this.windIcon,
//     required this.windDirection,
//     required this.surfStatus,
//     required this.surfIcon,
//   });
//
//   int hour;
//   IconData icon;
//   String windSpeed;
//   IconData windIcon;
//   String windDirection;
//   String surfStatus;
//   IconData surfIcon;
// }
//
// class _WeatherExpansionState extends State<WeatherExpansion> {
//   final List<Hour> hours = generateItems();
//   final List<Map<String, dynamic>> _items = [];
//
//   static List<Hour> generateItems() {
//     final now = DateTime.now();
//     return [
//       Hour(
//         hourItems: generateHourItems(),
//       ),
//       Hour(
//         hourItems: generateHourItems(),
//       ),
//       Hour(
//         hourItems: generateHourItems(),
//       ),
//       Hour(
//         hourItems: generateHourItems(),
//       ),
//       Hour(
//         hourItems: generateHourItems(),
//       ),
//     ];
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     final today = DateTime.now();
//     _items.add({
//       "date": today,
//     });
//     for (var i = 1; i <= 4; i++) {
//       final upcomingDate = today.add(Duration(days: i));
//       _items.add({
//         "date": upcomingDate,
//       });
//     }
//   }
//
//   static List<HourItem> generateHourItems() {
//     final List<HourItem> hourItems = [];
//     final now = DateTime.now();
//     for (int i = 0; i < 5; i++) {
//       final hour = now.add(Duration(hours: i)).hour;
//       hourItems.add(
//         HourItem(
//           hour: hour,
//           icon: Icons.wb_sunny_outlined,
//           windSpeed: '8',
//           windIcon: Icons.umbrella,
//           windDirection: '0,0mm',
//           surfStatus: '04:56',
//           surfIcon: Icons.sunny_snowing,
//         ),
//       );
//     }
//     return hourItems;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final now = DateTime.now();
//     return Scaffold(
//         backgroundColor: kSecondaryColor,
//         body: ListView.builder(
//             itemCount: _items.length,
//             itemBuilder: (_, index) {
//               final item = _items[index];
//               final date = item['date'] as DateTime;
//               final dateFormat = DateFormat('EEE, MMM d');
//               final isToday = index == 0;
//               return Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: Card(
//                   key: PageStorageKey(item['id']),
//                   color: const Color(0xff223979),
//                   elevation: 4,
//                   child: ExpansionTile(
//                     iconColor: Colors.white,
//                     collapsedTextColor: Colors.white,
//                     collapsedIconColor: Colors.white,
//                     childrenPadding: const EdgeInsets.symmetric(
//                       vertical: 10,
//                     ),
//                     expandedCrossAxisAlignment: CrossAxisAlignment.end,
//                     title: Text(
//                       isToday ? "Today" : dateFormat.format(date),
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontFamily: 'Righteous',
//                         fontSize: 20,
//                       ),
//                     ),
//                     subtitle: const WeatherRowWidget(),
//                     tilePadding: const EdgeInsets.all(11),
//                     textColor: Colors.white,
//                     children: hours[index].hourItems.map((HourItem hourItem) {
//                       return Container(
//                         width: 500,
//                         decoration: BoxDecoration(
//                           color: kDarkBlue,
//                           border: Border.all(
//                             color: const Color.fromARGB(255, 88, 84, 84),
//                             width: 1,
//                           ),
//                         ),
//                         child: ListTile(
//                           leading: Text('${hourItem.hour}:00'),
//                           title: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Expanded(
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Icon(
//                                       hourItem.icon,
//                                       color: Colors.white,
//                                       size: 30,
//                                     ),
//                                     Text(
//                                       hourItem.windSpeed,
//                                       style: const TextStyle(
//                                         color: Colors.white,
//                                         fontFamily: 'Righteous',
//                                         fontSize: 18,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Icon(
//                                       hourItem.windIcon,
//                                       color: Colors.white,
//                                       size: 30,
//                                     ),
//                                     Text(hourItem.windDirection,
//                                         style: const TextStyle(
//                                           color: Colors.white,
//                                           fontFamily: 'Righteous',
//                                           fontSize: 18,
//                                         )),
//                                   ],
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Icon(
//                                       hourItem.surfIcon,
//                                       color: Colors.white,
//                                       size: 30,
//                                     ),
//                                     Text(
//                                       hourItem.surfStatus,
//                                       style: const TextStyle(
//                                           color: Colors.white,
//                                           fontFamily: 'Righteous',
//                                           fontSize: 18),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                 ),
//               );
//             }));
//   }
// }
