import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/constants/app_colors.dart';
import 'package:weather_app/constants/text_styles.dart';
import 'package:weather_app/utils/get_weather_icons.dart';

import '../models/famous_city.dart';
import '../providers/get_weather_by_city_provider.dart';

class FamousCityWidget extends StatelessWidget {
  const FamousCityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 100, // The GridView will be at least 100 pixels tall
        maxHeight: 600, // But no taller than 500 pixels
      ),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: famousCities.length,
        itemBuilder: (context, index) {
          return FamousCityTile(
            cityName: famousCities[index].name,
            index: index,
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
      ),
    );
  }
}

class FamousCityTile extends ConsumerWidget {
  final String cityName;
  final int index;
  const FamousCityTile({
    super.key,
    required this.cityName,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherData = ref.watch(getweatherByCityNameProvider(cityName));
    return weatherData.when(
      data: (data) {
        return Material(
          color: index == 0 ? AppColors.lightBlue : AppColors.accentBlue,
          elevation: index == 0 ? 8 : 0,
          borderRadius: BorderRadius.circular(25.0),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${data.main.temp.round().toString()}°C',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            data.weather[0].description,
                            style: TextStyles.subtitleText,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(width: 10),
                    Image.asset(
                      getWeatherIcon(
                        weatherCode: data.weather[0].id,
                      ),
                      width: 50,
                    ),
                  ],
                ),
                Text(
                  cityName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      error: (error, sTrace) {
        return Center(
          child: Text('Error: $error, StackTrace: $sTrace'),
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
