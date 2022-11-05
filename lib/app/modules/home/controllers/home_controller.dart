// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tonton/app/data/providers/user_provider.dart';

import 'package:tonton/app/modules/home/widgets/filter_widget.dart';

import '../../../routes/app_pages.dart';
import '../../../services/auth_services.dart';

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'rating': rating,
      'imageURL': imageURL,
      'createdAt': createdAt?.millisecondsSinceEpoch,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      title: map['title'] != null ? map['title'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      rating: map['rating'] != null ? map['rating'] as int : null,
      imageURL: map['imageURL'] != null ? map['imageURL'] as String : null,
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) =>
      Movie.fromMap(json.decode(source) as Map<String, dynamic>);
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
  final _authService = Get.find<AuthService>();
  final _userProvider = Get.find<UserProvider>();
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
    final _authService = Get.find<AuthService>();

    print(_authService.isAuthenticate);
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  getUser() async {
    try {
      final user = await _userProvider.getUser();
      print(user?.toJson());
    } catch (e) {
      print(e);
    }
  }

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

    // tarikh.value = await showDatePicker(
    //   context: Get.context!,
    //   initialDate: now,
    //   firstDate: DateTime(2000),
    //   //lastDate: now,
    //   lastDate: DateTime(now.year + 2),
    // );

    if (Platform.isIOS) {
      _showDialog(
        CupertinoDatePicker(
          initialDateTime: now,
          mode: CupertinoDatePickerMode.date,
          // This is called when the user changes the date.
          onDateTimeChanged: (DateTime newDate) {
            tarikh.value = newDate;
          },
        ),
      );
    } else {
      tarikh.value = await showDatePicker(
        context: Get.context!,
        initialDate: now,
        firstDate: DateTime(2000),
        //lastDate: now,
        lastDate: DateTime(now.year + 2),
      );
    }
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: Get.context!,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  void onRating(double value) {
    populariti.value = value;
  }

  void onLogout() {
    _authService.deleteToken();
    Get.offAllNamed(Routes.REGISTER);
  }
}
