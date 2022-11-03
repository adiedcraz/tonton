import 'package:get/get.dart';
import 'package:tonton/app/data/providers/movie_provider.dart';

import '../controllers/not_found_controller.dart';

class NotFoundBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotFoundController>(
      () => NotFoundController(),
    );
  }
}
