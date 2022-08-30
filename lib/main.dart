import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:shortvideo/modules/splash/splash_binding.dart';
// import 'package:shortvideo/modules/splash/splash_page.dart';
import 'package:shortvideo/routes/pages.dart';
import 'package:shortvideo/core/theme/theme.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'core/store/app_binding.dart';
import 'core/utils/dependency_injection.dart';
import 'core/utils/gloab_config.dart';

import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await GloabConfig.init();
  await DenpendencyInjection.init();
  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      initialBinding: AppBindings(),
      locale: const Locale("zh-CN"),
      builder: (context, child) => Scaffold(
            // Global GestureDetector that will dismiss the keyboard
            body: GestureDetector(
              onTap: () {
                hideKeyboard(context);

              },
              child: child,
            ),
          ),
      theme: appThemeData,
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,

      // initialBinding: SplashBinding(),
      home: const Home()));
}

void hideKeyboard(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

class HomeController extends GetxController {
  final box = GetStorage();
  late SharedPreferences _prefs;
  int count = 1;

  // @override
  // void onInit() async {
  //   // var _count = box.read('count') ?? 0;
  //   _prefs = await SharedPreferences.getInstance();
  //   count = _prefs.getInt('counter') ?? 0;
  //   // count = RxInt(_count);
  //   print(count);
  //   super.onInit();
  //   update();
  // }

  increment() async {
    count++;
    print(count);
    // var _prefs = await SharedPreferences.getInstance();
    // await _prefs.setInt('counter', count);
    update();
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final HomeController c = Get.put(HomeController());
    FlutterNativeSplash.remove();

    return Scaffold(
        // Use Obx(()=> to update Text() whenever count is changed.
        appBar: AppBar(title: Text("Clicks: ${c.count}")),

        // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
        body: Center(
            child: ElevatedButton(
                child: const Text("Go to Other"),
                onPressed: () => Get.offAllNamed("/bottom_nav"))),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add), onPressed: c.increment));
  }
}

// class Other extends StatelessWidget {
//   // You can ask Get to find a Controller that is being used by another page and redirect you to it.

//   Other({Key? key}) : super(key: key);

//   final Controller c = Get.find();

//   @override
//   Widget build(context) {
//     // Access the updated count variable
//     return Scaffold(body: Center(child: Text("${c.count}")));
//   }
// }
