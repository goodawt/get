/*
 * @Author: your name
 * @Date: 2020-12-08 20:57:12
 * @LastEditTime: 2020-12-13 02:43:24
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /todo/lib/modules/login/components/body.dart
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import '../login_controller.dart';

class Body extends GetView {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
            width: Get.width,
            padding: const EdgeInsets.fromLTRB(15.0, 115.0, 0.0, 0.0),
            child: const Text('Welcome')),
      ]),
    );
  }
}
