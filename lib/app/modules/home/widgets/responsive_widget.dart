import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetXFirstWay();
  }
}

class GetXFirstWay extends GetResponsiveView<HomeController> {
  GetXFirstWay({super.key});

  @override
  Widget? builder() {
    if (screen.isPhone) {
      return const Icon(
        Icons.phone,
        color: Colors.orange,
      );
    }
  }
}
