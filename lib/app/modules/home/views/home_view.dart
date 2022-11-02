import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tonton/app/modules/home/widgets/body_widget.dart';

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
    );
  }
}
