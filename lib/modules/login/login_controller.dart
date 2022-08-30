// /*
//  * @Author: your name
//  * @Date: 2020-12-08 20:57:12
//  * @LastEditTime: 2020-12-13 01:24:32
//  * @LastEditors: Please set LastEditors
//  * @Description: In User Settings Edit
//  * @FilePath: /todo/lib/modules/login/login_controller.dart
//  */
// import 'package:get/get.dart';
// import 'package:shortvideo/data/model/login_bean.dart';
// import 'package:shortvideo/data/local/local_login_model_reposity.dart';
// import 'package:shortvideo/data/repositories/login_repository.dart';
// import 'package:shortvideo/routes/app_pages.dart';
// import 'package:shortvideo/utils/extension/get_extension.dart';

// class LoginController extends GetxController {
//   final LoginRepository repository = Get.find<LoginRepository>();
//   String _username;
//   String _password;

//   void onUsernameChanged(String username) {
//     _username = username.trim();
//   }

//   void onPasswordChanged(String password) {
//     _password = password.trim();
//   }

//   sumit() async {
//     if (_username == null || _username.trim.toString().isEmpty) {
//       Get.snackbar('Hi', 'Your Email not be null');
//       return;
//     }

//     if (_password == null || _password.trim.toString().isEmpty) {
//       Get.snackbar('Hi', 'Your Password not be null');
//       return;
//     }
//     Get.loading();
//     try {
//       LoginBean bean = await repository.login(_username, _password);
//       Get.dismiss();
//       LocalLoginModelRepository.saveLoginModel(bean);
//       Get.offAllNamed(Routes.TASK);
//     } catch (e) {
//       Get.dismiss();
//       Get.snackbar('Error', e.message ?? "登录失败");
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortvideo/core/store/app_controller.dart';
import 'package:shortvideo/data/db/share.dart';
import 'package:shortvideo/routes/pages.dart';

import '../../data/http/http.dart';

class LoginController extends GetxController with StateMixin<dynamic> {
  var formKey = GlobalKey<FormState>();
  var authApi = Get.find<AuthApi>();
  var appLogic = Get.find<AppController>();

  var username = ''.obs;
  var password = ''.obs;

  String? usernameValidator(String? str) {
    if (str == null || str.isEmpty) {
      return "账号不能为空";
    }
    // GetUtils.isEmail(str);
    // GetUtils.isPhoneNumber(str);
    return null;
  }

  String? passwordValidator(String? str) {
    if (str == null || str.isEmpty) {
      return "密码不能为空";
    }
    return null;
  }

  login() async {
    if (formKey.currentState!.validate()) {
      final Response res = await authApi.login(username.value, password.value);
      if (!res.hasError) {
        ShareStorage.setToken(res.body['token']);
        appLogic.login(res.body);
        Get.back();
      } else {
        Get.snackbar("登陆失败", "${res.statusText}").show();
      }
    }
  }
}
