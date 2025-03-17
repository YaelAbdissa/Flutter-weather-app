import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/constants/app_colors.dart';
import 'package:weather_app/constants/text_styles.dart';
import 'package:weather_app/extensions/date_time.dart';
import 'package:weather_app/utils/get_weather_icons.dart';

import '../providers/weekly_weather_provider.dart';
import 'subscript_text.dart';

class WeeklyForecastWidget extends ConsumerWidget {
  const WeeklyForecastWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weeklyForecastData = ref.watch(weeklyWeatherProvider);
    return weeklyForecastData.when(
      data: (weeklyForecast) {
        return ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final dayOfweek =
                DateTime.parse(weeklyForecast.daily.time[index]).dayOfWeek;
            final date = weeklyForecast.daily.time[index];
            final temp = weeklyForecast.daily.temperature2mMax[index];
            final weatherCode = weeklyForecast.daily.weatherCode[index];
            return WeeklyWeatherTile(
              day: dayOfweek,
              date: date,
              temp: temp.toInt().toString(),
              icon: getWeatherIcon(weatherCode: weatherCode.toInt()),
            );
          },
        );
      },
      error: (error, stacktrace) {
        return Center(
          child: Text(
            'Error: $error StackTrace: $stacktrace',
            style: TextStyles.h2,
          ),
        );
      },
      loading: () {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class WeeklyWeatherTile extends StatelessWidget {
  final String day;
  final String date;
  final String temp;
  final String icon;

  const WeeklyWeatherTile({
    super.key,
    required this.day,
    required this.date,
    required this.temp,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      margin: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.accentBlue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                day,
                style: TextStyles.h3,
              ),
              Text(
                date,
                style: TextStyles.subtitleText,
              ),
            ],
          ),
          SubscriptText(
            text: temp,
            superScript: '°C',
            color: AppColors.white,
            superscriptColor: AppColors.grey,
          ),
          Image.asset(
            icon,
            width: 50,
            height: 50,
          ),
        ],
      ),
    );
  }
}
