import 'package:flutter/material.dart';
import 'package:flutter_native_splash/cli_commands.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:surfs_up/all_pages.dart';
import 'package:surfs_up/api/weather_data.dart';
import 'package:surfs_up/language_provider.dart';
import 'package:surfs_up/shared/constants/custom_text_style.dart';
import 'package:surfs_up/shared/widgets/expanded_item_widget.dart';
import 'package:surfs_up/shared/widgets/info_alert_box.dart';
import 'package:surfs_up/shared/widgets/share_button.dart';
import 'package:surfs_up/shared/widgets/surf_row_widget.dart';

class SurfPage extends StatelessWidget {
  const SurfPage({super.key, required this.listOfDayWeatherData});

  final List<List<WeatherData>> listOfDayWeatherData;

  @override
  Widget build(BuildContext context) {
    final selectedLanguage =
        Provider.of<LanguageProvider>(context).selectedLanguage;
    if (listOfDayWeatherData[0].isNotEmpty) {
      return FutureBuilder<void>(
        future: initializeDateFormatting(
            'sv'), // Initialize the date symbols for the Swedish locale
        builder: (context, snapshot) {
          return Scaffold(
            body: ListView.builder(
                itemCount: listOfDayWeatherData.length,
                itemBuilder: (_, index) {
                  final item = listOfDayWeatherData[index];
                  final DateTime date = item.first.date;
                  final DateFormat dateFormat =
                      selectedLanguage == Language.swedish
                          ? DateFormat('E, MMM d', 'sv')
                          : DateFormat('EEE, MMM d');
                  final bool isToday = (index == 0);
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Card(
                      // key: PageStorageKey(item['id']),
                      color: kMediumBlue,
                      elevation: 4,
                      child: ExpansionTile(
                        iconColor: Colors.white,
                        collapsedTextColor: Colors.white,
                        collapsedIconColor: Colors.white,
                        childrenPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        expandedCrossAxisAlignment: CrossAxisAlignment.end,
                        title: Text(
                          isToday
                              ? selectedLanguage == Language.english
                                  ? "Today"
                                  : "Idag"
                              : dateFormat.format(date).capitalize(),
                          style: CustomTextStyle.title3,
                        ),
                        subtitle:
                            RowWidget(dayData: listOfDayWeatherData[index]),
                        tilePadding: const EdgeInsets.all(11),
                        textColor: Colors.white,
                        children: item.asMap().entries.map((entry) {
                          final WeatherData hourItem = entry.value;
                          final int hourIndex = entry.key;
                          final bool isEven = hourIndex % 2 == 0;
                          final Color tileColor = isEven
                              ? kDarkBlue
                              : const Color(
                                  0xff212943); // Set the colors for every other ListTile

                          return Container(
                            width: 500,
                            decoration: BoxDecoration(
                              color: tileColor,
                              border: Border.all(
                                color: Colors.white,
                                width: 0.65,
                              ),
                            ),
                            child: ListTile(
                              leading: Text('${hourItem.date.hour}:00'),
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ExpandedItem(
                                    itemIcon: Icons.air_outlined,
                                    itemText:
                                        '${hourItem.windSpeed}m/s (${hourItem.gust})',
                                  ),
                                  ExpandedItem(
                                    itemIcon: hourItem.windIcon,
                                    itemText: hourItem.windDirectionSymbol,
                                  ),
                                  hourItem.surfIcon,
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                }),
            floatingActionButton: Stack(
              children: const [
                Positioned(
                  bottom: 16.0,
                  right: 16.0,
                  child: InfoButtonClass(),
                ),
                Positioned(
                  bottom: 16.0,
                  left: 16.0,
                  child: ShareButtonClass(),
                ),
              ],
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
        },
      );
    } else {
      return const Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
            child: Text(
          'Something went wrong, could not load data for from SMHI and YR.\n\n'
          'Please try again later.',
          textAlign: TextAlign.center,
        )),
      );
    }
  }
}
