import 'package:let_api_flutter/common_libs.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferenceProvider = FutureProvider(
  (ref) async => SharedPreferences.getInstance(),
);
