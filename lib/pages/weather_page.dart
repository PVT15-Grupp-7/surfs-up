import 'package:flutter/material.dart';
import 'package:flutter_native_splash/cli_commands.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:surfs_up/data/weather_data.dart';
import 'package:surfs_up/data/location_data.dart';
import 'package:surfs_up/shared/language_provider.dart';
import 'package:surfs_up/shared/constants/colors.dart';
import 'package:surfs_up/shared/constants/custom_text_style.dart';
import 'package:surfs_up/shared/widgets/expanded_item_widget.dart';
import 'package:surfs_up/shared/widgets/weather_row_widget.dart';

class WeatherPage extends StatelessWidget {
  final Location location;

  const WeatherPage(
      {super.key, required this.listOfDayWeatherData, required this.location});

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
            return ListView.builder(
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
                        subtitle: WeatherRowWidget(
                            dayData: listOfDayWeatherData[index],
                            location: location),
                        tilePadding: const EdgeInsets.all(11),
                        textColor: Colors.white,
                        children: item.asMap().entries.map((entry) {
                          final WeatherData hourItem = entry.value;
                          final int hourIndex = entry.key;
                          final bool isEven = hourIndex % 2 == 0;
                          final Color tileColor =
                              isEven ? kDarkBlue : const Color(0xff212943);
                          return Container(
                            // width: 500,
                            decoration: BoxDecoration(
                              color: tileColor,
                              border: Border.all(
                                color: kTransparentGrey,
                                width: 1,
                              ),
                            ),
                            child: ListTile(
                              leading: Text('${hourItem.date.hour}:00'),
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ExpandedItem(
                                    itemIcon: hourItem.weatherIcon,
                                    itemText: ' ${hourItem.temperature}',
                                  ),
                                  ExpandedItem(
                                    itemIcon: Icons.umbrella,
                                    itemText: '${hourItem.precipitation}mm',
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                });
          });
    } else {
      return const Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
            child: Text(
          'Something went wrong, could not load data from SMHI and YR.\n\n'
          'Please try again later.',
          textAlign: TextAlign.center,
        )),
      );
    }
  }
}
