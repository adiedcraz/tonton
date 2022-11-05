import 'package:auto_animated/auto_animated.dart';
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
          // ? ListView.builder(
          //     itemCount: controller.movies.length,
          //     itemBuilder: (context, index) {
          //       final movie = controller.movies[index];

          //       return CardWidget(
          //         movie: movie,
          //         onTap: () async {
          //           Get.toNamed(
          //             Routes.MOVIE_DETAIL,
          //             arguments: movie,
          //           );
          //         },
          //       );
          //     },
          //   )
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: LiveList(
                itemCount: controller.movies.length,
                itemBuilder: (context, index, animation) {
                  final movie = controller.movies[index];

                  return FadeTransition(
                    opacity: Tween<double>(
                      begin: 0,
                      end: 1,
                    ).animate(animation),
                    child: CardWidget(
                      movie: movie,
                      onTap: () async {
                        Get.toNamed(
                          Routes.MOVIE_DETAIL,
                          arguments: movie,
                        );
                      },
                    ),
                  );
                },
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
