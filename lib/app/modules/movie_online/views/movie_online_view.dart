import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/movie_online_controller.dart';
import '../widgets/list_widget.dart';

class MovieOnlineView extends GetView<MovieOnlineController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MovieOnlineView'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: controller.getMovie,
        child: const ListWidget(),
      ),
    );
  }
}
