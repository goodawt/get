import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/db/share.dart';
import '../../routes/pages.dart';
import '../store/app_controller.dart';

class AuthMiddleware extends GetMiddleware{
  bool get isAuthenticated => ShareStorage.isAuthenticated ;
  @override
  RouteSettings? redirect(String? route) {
    debugPrint('=======AuthMiddleware.redirect:$route $isAuthenticated');
    if (!isAuthenticated) {
      return const RouteSettings(name: Routes.LOGIN);
    }
    return super.redirect(route);
  }

  @override
  GetPage? onPageCalled(GetPage? page) {
    debugPrint('=======AuthMiddleware.onPageCalled:$page');
    return super.onPageCalled(page);
  }
}