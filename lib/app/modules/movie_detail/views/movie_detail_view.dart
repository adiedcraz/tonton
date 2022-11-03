import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tonton/app/modules/sample_navigation/views/sample_navigation_view.dart';

import '../controllers/movie_detail_controller.dart';

class MovieDetailView extends GetView<MovieDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MovieDetailView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'MovieDetailView is working',
              style: TextStyle(fontSize: 20),
            ),
            TextButton.icon(
              onPressed: () {
                Get.back(result: 'Berjaya');
              },
              icon: Icon(Icons.arrow_back),
              label: Text('Kembali'),
            ),
            TextButton.icon(
              onPressed: () {
                print(Get.arguments);
              },
              icon: Icon(Icons.add_home),
              label: Text('Get arguments'),
            ),
            TextButton.icon(
              onPressed: () {
                // Get.to(
                //   SampleNavigationView()
                // );

                //Get.off(SampleNavigationView());
                Get.offAll(SampleNavigationView());
              },
              icon: Icon(Icons.logout),
              label: Text('Clear page'),
            ),
            TextButton.icon(
              onPressed: () {
                print(Get.parameters['id']);
              },
              icon: Icon(Icons.add_alarm),
              label: Text('Parameter Value'),
            )
          ],
        ),
      ),
    );
  }
}
