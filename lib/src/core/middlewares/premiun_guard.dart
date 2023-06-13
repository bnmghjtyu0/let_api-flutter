import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_api_flutter/src/routes/route_helper.dart';

class PremiumGuard extends GetMiddleware {
  // final authService = Get.find<AuthService>();

  @override
  RouteSettings? redirect(String? route) {
    return false ? null : const RouteSettings(name: RouteNames.initial);
  }
}
