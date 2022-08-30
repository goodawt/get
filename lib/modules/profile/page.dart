import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortvideo/core/store/app_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var logic = Get.find<AppController>();
    return Scaffold(
      appBar:
          AppBar(title: const Text('MyPage'), backgroundColor: Colors.black),
      body: Obx(() => Column(
            children: [Text('${logic.userInfo}')],
          )),
    );
  }
}
