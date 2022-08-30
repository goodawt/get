/*
 * @Author: your name
 * @Date: 2020-12-08 20:57:12
 * @LastEditTime: 2020-12-12 14:37:43
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /todo/lib/routes/app_pages.dart
 */
/*
 * @Author: your name
 * @Date: 2020-12-08 20:57:12
 * @LastEditTime: 2020-12-08 21:23:35
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /todo/lib/routes/app_pages.dart
 */
import 'package:get/get.dart';
import 'package:shortvideo/core/middleware/auth_middleware.dart';
import 'package:shortvideo/core/store/app_binding.dart';
import 'package:shortvideo/modules/login/login_page.dart';
import 'package:shortvideo/modules/profile/page.dart';
import 'package:shortvideo/modules/signup/page.dart';
import 'package:shortvideo/modules/splash/page.dart';
import 'package:shortvideo/modules/nav/page.dart';

import '../modules/login/login_binding.dart';
part 'routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashPage(),
      // binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.SIGN_UP,
      page: () => const SignUpPage(),
      // binding: SiginUpBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => const ProfilePage(),
      middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: Routes.BOTTOM_NAV,
      page: () => BootomNavPage(),
      binding: AppBindings()
    ),
  ];
}
