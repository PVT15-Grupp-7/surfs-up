import 'smhi_api_call.dart';
import '../data/weather_data.dart';
import 'yr_api_call.dart';

/// This function is used to average the data from SMHI and YR.
Future<List<WeatherData>> getData(double lat, double lon) async {
  List<WeatherData> smhiData = await getSMHI(lat, lon);
  List<WeatherData> yrData = await getYR(lat, lon);

  if (smhiData.isEmpty) {
    return smhiData;
  } else if (yrData.isNotEmpty) {
    for (int i = 0; i < 48; i++) {
      WeatherData smhi = smhiData[i];
      WeatherData yr = yrData[i];

      smhi.setTemperature(((smhi.temperature + yr.temperature) / 2).round());
      smhi.setWindSpeed(((smhi.windSpeed + yr.windSpeed) / 2).round());
      smhi.setWindDirection(
          ((smhi.windDirection + yr.windDirection) / 2).round());
    }
  }
  return smhiData;
}
