import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tonton/app/modules/home/widgets/responsive_widget.dart';
import 'package:tonton/app/modules/home/widgets/sample_responsive_widget.dart';

import '../controllers/home_controller.dart';
import 'empty_widget.dart';

class BodyWidget extends GetView<HomeController> {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.movieList.isEmpty ? EmptyWidget() : ResponsiveWidget(),
    );
  }
}
