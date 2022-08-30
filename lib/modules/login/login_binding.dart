// import 'package:get/get.dart';
// import 'package:todo/data/api/login_api.dart';
// import 'package:todo/data/repositories/login_repository.dart';
// import 'package:todo/modules/login/login_controller.dart';

// class LoginPageBinding implements Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut(() => LoginApi());
//     Get.lazyPut(() => LoginRepository());
//     Get.lazyPut<LoginController>(
//       () => LoginController(),
//     );
//   }
// }


import 'package:get/get.dart';
import 'package:shortvideo/data/http/http.dart';
import 'package:shortvideo/modules/login/login_controller.dart';

class LoginPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => AuthApi());
  }
}
