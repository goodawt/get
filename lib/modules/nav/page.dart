import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shortvideo/modules/profile/page.dart';
import 'package:shortvideo/modules/signup/page.dart';
import 'package:shortvideo/modules/splash/page.dart';

class MainState {
  //底部导航栏索引
  RxInt bottombar_index = 0.obs;
}

//全局状态控制器
class GlobalStateController extends GetxController {
  MainState state = MainState();
  //改变底部导航栏索引
  changeBottomBarIndex(int index) {
    print(state.bottombar_index.value);
    state.bottombar_index.value = index;
  }
}

class BootomNavPage extends StatelessWidget {
  //全局状态控制器
  final globalStateController = Get.put(GlobalStateController());
  var mainState = Get.find<GlobalStateController>().state;

  List bodyPageList =const [
    ProfilePage(),
    SignUpPage(),
    SplashPage(),
  ];

  BootomNavPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //主题
        body: Obx(() => bodyPageList[mainState.bottombar_index.value]),
        //底部导航条
        bottomNavigationBar: Obx(() => BottomNavigationBar(
              // 当前菜单下标
              currentIndex: mainState.bottombar_index.value,
              // 点击事件,获取当前点击的标签下标
              onTap: (int index) {
                globalStateController.changeBottomBarIndex(index);
              },
              iconSize: 30.0,
              fixedColor: Colors.red,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.category), label: "分类"),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: "设置")
              ],
            )));
  }
}
