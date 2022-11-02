import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'card_grid_widget.dart';
import 'responsive_widget.dart';

class GridWidget extends GetView<HomeController> {
  const GridWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(Get.context!).size.width;
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //crossAxisCount: 3,
          crossAxisCount: width ~/ 200,
        ),
        itemCount: controller.movieList.length,
        itemBuilder: (context, index) {
          final movie = controller.movieList[index];

          return CardGridWidget(movie: movie);
        });
  }
}
