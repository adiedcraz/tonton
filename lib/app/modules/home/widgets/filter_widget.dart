import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'button_widget.dart';

class FilterWidget extends GetView<HomeController> {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.deepPurpleAccent,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(40.0),
        topLeft: Radius.circular(40.0),
      ),
      child: Column(
        children: [
          ListTile(
            onTap: controller.filterDate,
            title: Text('Tarikh'),
            subtitle: Obx(
              () => Text(
                //controller.tarikh.value.toString(),
                controller.selectDate,
              ),
            ),
          ),
          ListTile(
            title: Text('Rating'),
            subtitle: RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: controller.onRating,
            ),
          ),
          ButtonWidget()
        ],
      ),
    );
  }
}
