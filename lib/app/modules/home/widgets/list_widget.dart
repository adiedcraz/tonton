import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'card_widget.dart';

class ListWidget extends GetView<HomeController> {
  const ListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.movieList.length,
      itemBuilder: (context, index) {
        final movie = controller.movieList[index];

        return CardWidget(movie: movie);
      },
    );
  }
}
