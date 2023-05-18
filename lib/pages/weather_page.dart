import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:surfs_up/api/weather_data.dart';
import 'package:surfs_up/data/location_data.dart';
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
    if (listOfDayWeatherData[0].isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
            child: Text(
              'Something went wrong, could not load data from SMHI and YR.\n\n'
                  'Please try again later.',
              textAlign: TextAlign.center,)),
      );
    } else {
      return ListView.builder(
          itemCount: listOfDayWeatherData.length,
          itemBuilder: (_, index) {
            final item = listOfDayWeatherData[index];
            final DateTime date = item.first.date;
            final DateFormat dateFormat = DateFormat('EEE, MMM d');
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
                    isToday ? "Today, avg" : '${dateFormat.format(date)}, avg',
                    style: CustomTextStyle.title3,
                  ),
                  subtitle: WeatherRowWidget(
                      dayData: listOfDayWeatherData[index], location: location),
                  tilePadding: const EdgeInsets.all(11),
                  textColor: Colors.white,
                  children: item.map((WeatherData hourItem) {
                    return Container(
                      width: 500,
                      decoration: BoxDecoration(
                        color: kDarkBlue,
                        border: Border.all(
                          color: kTransparentGrey,
                          width: 1,
                        ),
                      ),
                      child: ListTile(
                        leading: Text('${hourItem.date.hour}:00'),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
    }
  }
}
