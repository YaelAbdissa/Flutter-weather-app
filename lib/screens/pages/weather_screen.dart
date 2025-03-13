import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../extensions/date_time.dart';
import '../../constants/text_styles.dart';
import '../../providers/current_weather_provider.dart';
import '../../widgets/gradient_container.dart';
import '../../widgets/hourly_forcast_widget.dart';
import '../../widgets/weather_info.dart';
import '../../constants/app_colors.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherData = ref.watch(currentWeatherProvider);
    return weatherData.when(data: (weather) {
      return GradientContainer(
        children: [
          SizedBox(
            width: double.infinity,
          ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Today ',
                    style: TextStyles.h2,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'View full forecast',
                      style: TextStyles.subtitleText.copyWith(
                        color: AppColors.lightBlue,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              HourlyForcastWidget(),
            ],
          )
        ],
      );
    }, error: (error, stacktrace) {
      return Center(
        child: Text('Error: $error'),
      );
    }, loading: () {
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
