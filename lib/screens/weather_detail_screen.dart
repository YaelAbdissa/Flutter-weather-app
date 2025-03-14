import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../extensions/date_time.dart';
import '../constants/text_styles.dart';
import '../widgets/gradient_container.dart';
import '../providers/get_weather_by_city_provider.dart';
import '../widgets/weather_info.dart';

class WeatherDetailScreen extends ConsumerWidget {
  final String cityName;
  const WeatherDetailScreen({super.key, required this.cityName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherData = ref.watch((getweatherByCityNameProvider(cityName)));
    return Scaffold(
        body: weatherData.when(data: (weather) {
      return GradientContainer(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              weather.name,
              style: TextStyles.h1,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              DateTime.now().dateTime,
              style: TextStyles.subtitleText,
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 260,
              child: Image.asset(
                "assets/icons/${weather.weather[0].icon.replaceAll('n', 'd')}.png",
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              weather.weather[0].description,
              style: TextStyles.h2,
            ),
            SizedBox(
              height: 40,
            ),
            WeatherInfo(weather: weather),
            SizedBox(height: 30),
            SizedBox(height: 15),
          ],
        )
      ]);
    }, error: (error, sTrace) {
      return Center();
    }, loading: () {
      return Center();
    }));
  }
}
