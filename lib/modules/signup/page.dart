import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortvideo/data/db/share.dart';

import '../../routes/pages.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('signup')),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Get.toNamed(Routes.PROFILE),
              child: const Text("前往个人信息"),
            ),
            ElevatedButton(
              onPressed: () {
                ShareStorage.removeToken();
                Get.snackbar("退出账号", "已清空token");
              },
              child: const Text("登出"),
            )
          ],
        ),
      ),
    );
  }
}
