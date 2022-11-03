import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tonton/app/modules/movie_online/controllers/movie_online_controller.dart';

import '../../../routes/app_pages.dart';
import 'card_widget.dart';

class ListWidget extends GetView<MovieOnlineController> {
  const ListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.hashData
          ? ListView.builder(
              itemCount: controller.movies.length,
              itemBuilder: (context, index) {
                final movie = controller.movies[index];

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
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
