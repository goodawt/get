import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shortvideo/data/enums/box_enum.dart';

class AppController extends GetxController {
  var userInfo = <String,dynamic>{}.obs;

  login (Map<String,dynamic> info){
    userInfo.value = info;
    update();
  }
}