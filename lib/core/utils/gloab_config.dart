import 'package:get_storage/get_storage.dart';

/// 初始化全局配置
class GloabConfig {
  static Future<void> init() async {
    // await GetStorage.init();
    final box = GetStorage();
    await box.initStorage;
    box.write('darkmode', true);
    bool isDark = box.read('darkmode') ?? false;
    print(isDark);
  }
}
