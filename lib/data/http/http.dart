import 'package:get/get.dart';

class BaseConnect extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = "https://630de83e109c16b9abf0338e.mockapi.io/api/v1";
  }
}

class AuthApi extends BaseConnect {
  @override
  void onInit() {
    super.onInit();
  }

  Future<Response> login(String username, String password) async =>
      await post("/login", {'username': username, 'password': password});
}
