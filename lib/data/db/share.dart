import 'package:get_storage/get_storage.dart';
import 'package:shortvideo/data/enums/box_enum.dart';

abstract class ShareStorage{
  static final box = GetStorage();
  static bool get isAuthenticated => box.hasData(BoxEnum.TOKEN);
  static setToken(String token){
    box.write(BoxEnum.TOKEN, token);
  }
  static removeToken(){
    box.remove(BoxEnum.TOKEN);
  }
}