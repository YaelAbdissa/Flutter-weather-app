import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/models/weather.dart';

import '../services/api_helper.dart';

final cweatherByCityNameProvider =
    FutureProvider.family<Weather, String>((ref, String cityName) async {
  return ApiHelper.getWeatherByCityName(cityName: cityName);
});
