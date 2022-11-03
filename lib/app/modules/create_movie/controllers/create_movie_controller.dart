import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../../home/controllers/home_controller.dart';

class CreateMovieController extends GetxController {
  //TODO: Implement CreateMovieController

  final count = 0.obs;
  //final movie = Rx<Movie?>(null);
  final movie = Rx<Movie>(Movie());
  final storageKey = 'Movie';
  late GetStorage box;
  var formKey = GlobalKey<FormState>();

  String get selectDate => movie.value.createdAt == null
      ? ''
      : DateFormat.yMd().format(movie.value.createdAt!);

  @override
  void onInit() {
    super.onInit();
    box = GetStorage();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void onTitleChanged(String value) {
    movie.value.title = value;
  }

  void onDescriptionChanged(String value) {
    movie.value.description = value;
  }

  void onRatingChanged(String value) {
    movie.value.rating = int.tryParse(value);
  }

  Future<void> onCreatedDtChanged() async {
    final now = DateTime.now();

    movie.value.createdAt = await showDatePicker(
      context: Get.context!,
      initialDate: now,
      firstDate: DateTime(2000),
      //lastDate: now,
      lastDate: DateTime(now.year + 2),
    );
    movie.refresh();
  }

  void onImageChanged(String value) {
    movie.value.imageURL = value;
  }

  String? validateTitle(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  void onSubmit() {
    if (formKey.currentState == null) return;
    if (!formKey.currentState!.validate()) return;

    print(movie.value.toJson());

    //final box = GetStorage();
    box.write(
      'movie',
      movie.value.toJson(),
    );

    Future.delayed(
      Duration(seconds: 3),
      () {
        final value = box.read('movie');
        print(value);
      },
    );
  }

  String? validateDescription(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  String? validateRating(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  String? validateUrl(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    if (!GetUtils.isURL(value)) return 'Url tidak sah';
    return null;
  }

  void onPadam() {
    box.remove(storageKey);

    Future.delayed(
      const Duration(seconds: 3),
    );
    final value = box.read(storageKey);
    print('dah delete' + value);
  }
}
