import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tonton/app/modules/movie_detail/views/movie_detail_view.dart';

import '../../../routes/app_pages.dart';
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

        return CardWidget(
          movie: movie,
          onTap: () async {
            // final respon = await Get.to(MovieDetailView(), arguments: 'Haiii');
            // print(respon);

            //untuk page replacement (cth Page Login)
            //Get.off(MovieDetailView());

            //Get.to(MovieDetailView());
            final parameter = {
              "id": "1",
              "name": "movie 1",
            };
            //Get.toNamed(Routes.MOVIE_DETAIL, parameters: parameter);
            //Get.toNamed('/movie-detail/2', parameters: parameter);
            Get.toNamed('/wewrwrwer');
          },
        );
      },
    );
  }
}
