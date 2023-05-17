import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:surfs_up/all_pages.dart';
import 'package:surfs_up/api/weather_data.dart';
import 'package:surfs_up/pages/preferences_page.dart';
import 'package:surfs_up/pages/safety_page.dart';
import 'package:surfs_up/pages/weather_page.dart';
import 'package:surfs_up/shared/constants/custom_text_style.dart';
import 'package:surfs_up/shared/widgets/expanded_item_widget.dart';
import 'package:surfs_up/shared/widgets/info_alert_box.dart';
import 'package:surfs_up/shared/widgets/surf_row_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:social_share/social_share.dart';

class SurfPage extends StatelessWidget {
  const SurfPage({super.key, required this.listOfDayWeatherData});

  final List<List<WeatherData>> listOfDayWeatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String contentUrl =
              'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif';
          String encodedContentUrl = Uri.encodeFull(contentUrl);

          // ska kolla om insta finns på enheten
          if (await canLaunch("instagram://")) {

            await launch("instagram://camera");


            await Future.delayed(const Duration(seconds: 1));


            String storyCreationUrl =
                "instagram://story-camera?media=$encodedContentUrl";


            await launch(Uri.parse(storyCreationUrl).toString());
          } else {
            print("Instagram app not installed.");

           
          }
        },
        child: const Text("Share to Instagram Story"),
      ),
      //floatingActionButton: const InfoButtonClass(),
      body: ListView.builder(
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
                    isToday ? "Today" : dateFormat.format(date),
                    style: CustomTextStyle.title3,
                  ),
                  subtitle: RowWidget(dayData: listOfDayWeatherData[index]),
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
                        leading:
                            Text('${hourItem.date.hour}:00'),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
    );
  }
}
