import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/api_helper.dart';

final weeklyWeatherProvider = FutureProvider((ref) async {
  return ApiHelper.getWeeklyForecast();
});
