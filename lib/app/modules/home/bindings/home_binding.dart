import 'package:get/get.dart';
import 'package:tonton/app/data/providers/user_provider.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<UserProvider>(
      () => UserProvider(),
    );
  }
}
