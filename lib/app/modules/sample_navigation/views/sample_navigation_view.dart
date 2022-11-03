import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sample_navigation_controller.dart';

class SampleNavigationView extends GetView<SampleNavigationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SampleNavigationView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SampleNavigationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
