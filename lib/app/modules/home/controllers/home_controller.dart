// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tonton/app/modules/home/widgets/filter_widget.dart';

class Movie {
  String? title;
  String? description;
  int? rating;
  String? imageURL;
  DateTime? createdAt;

  Movie({
    this.title,
    this.description,
    this.rating,
    this.imageURL,
    this.createdAt,
  });
}

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final List<Movie> movies = [
    Movie(
      title: 'Tajuk 1',
      description: 'Detail 1 Detail 1Detail 1 vDetail 1dvdvd',
      rating: 1,
      imageURL:
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
      createdAt: DateTime(2022, 11, 1),
    ),
    Movie(
      title: 'Tajuk 2',
      description: 'Detail 2',
      rating: 2,
      imageURL:
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
      createdAt: DateTime(2022, 11, 3),
    ),
  ];

  final count = 0.obs;
  final keyword = ''.obs;

  final tarikh = Rx<DateTime?>(null);
  final populariti = Rx<double?>(null);
  //bool = true / false;
  //double = 1.0;
  //int = 1;
  //List = [];
  //num = 1 / 10.1;
  //final keyword = Rx<String>('');
  //final keyword = RxString('');

  List<Movie> get movieList {
    List<Movie> filterMovie = movies;

    if (populariti.value != null) {
      filterMovie = filterMovie
          // .where((element) => element.rating == populariti.value?.toInt())
          .where((element) => element.rating == populariti.value)
          .toList();
    }

    if (tarikh.value != null) {
      filterMovie = filterMovie
          .where((element) => element.createdAt == tarikh.value)
          .toList();
    }

    if (keyword.isNotEmpty) {
      filterMovie = filterMovie
          .where((element) => element.title?.contains(keyword.value) ?? false)
          .toList();
    }

    return filterMovie;
  }

  String get selectDate => tarikh.value == null
      ? 'Pilih Tarikh'
      : DateFormat.yMd().format(tarikh.value!);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void onSearch(String value) {
    keyword.value = value;
  }

  void filter() {
    Get.bottomSheet(
      const FilterWidget(),
    );
  }

  Future<void> filterDate() async {
    final now = DateTime.now();

    tarikh.value = await showDatePicker(
      context: Get.context!,
      initialDate: now,
      firstDate: DateTime(2000),
      //lastDate: now,
      lastDate: DateTime(now.year + 2),
    );
  }

  void onRating(double value) {
    populariti.value = value;
  }
}
