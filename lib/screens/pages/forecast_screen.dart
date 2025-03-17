import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../extensions/date_time.dart';
import '../../constants/text_styles.dart';
import '../../widgets/gradient_container.dart';
import '../../widgets/hourly_forcast_widget.dart';
import '../../widgets/weekly_forecast_widget.dart';

class ForecastScreen extends ConsumerWidget {
  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GradientContainer(
      children: [
        SizedBox(
          width: double.infinity,
          height: 30,
        ),
        Align(
          child: Text(
            "Forecast Report",
            style: TextStyles.h1,
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Today ',
              style: TextStyles.h2,
            ),
            Text(
              DateTime.now().dateTime,
              style: TextStyles.subtitleText,
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        HourlyForcastWidget(),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Next Forecast',
              style: TextStyles.h2,
            ),
            Icon(
              Icons.calendar_month,
              color: Colors.white,
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        WeeklyForecastWidget(),
      ],
    );
  }
}
