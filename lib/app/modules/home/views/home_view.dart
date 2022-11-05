import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tonton/app/modules/home/widgets/body_widget.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            icon: Icon(Icons.search),
            hintText: 'Cari',
          ),
          onChanged: controller.onSearch,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: controller.filter,
            icon: Icon(Icons.filter_alt),
          )
        ],
      ),
      body: BodyWidget(),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              heroTag: '',
              onPressed: () {
                Get.toNamed(Routes.CREATE_MOVIE);
              },
              child: Icon(Icons.add),
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              Get.toNamed(Routes.MOVIE_ONLINE);
            },
            child: Icon(Icons.travel_explore),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              heroTag: '1',
              onPressed: controller.onLogout,
              child: Icon(Icons.logout),
            ),
          ),
        ],
      ),
    );
  }
}
