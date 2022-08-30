import 'package:get/get.dart';
import 'package:shortvideo/core/store/app_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppController());
  }

}