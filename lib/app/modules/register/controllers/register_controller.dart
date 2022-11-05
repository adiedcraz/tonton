import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tonton/app/data/models/user_model.dart';

import '../../../data/providers/user_provider.dart';
import '../../../routes/app_pages.dart';
import '../../../services/auth_services.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController

  final user = Rx<User>(User());
  final storageKey = 'TOKEN';
  late GetStorage box;
  var formKey = GlobalKey<FormState>();

  final passwordVisibleState = false.obs;

  bool get isHidePassword => passwordVisibleState.isFalse;

  final _userProvider = Get.find<UserProvider>();
  final _authService = Get.find<AuthService>();

  @override
  void onInit() {
    super.onInit();
    //_userProvider.home();
    //box = GetStorage();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void onUserNameChanged(String value) {
    user.value.username = value;
  }

  void onEmelChanged(String value) {
    user.value.email = value;
  }

  void onPasswordChanged(String value) {
    user.value.password = value;
  }

  Future<void> onSubmit() async {
    if (formKey.currentState == null) return;
    if (!formKey.currentState!.validate()) return;

    try {
      print(user.value.toJson());
      final token = await _userProvider.addUser(user.value);
      _authService.saveToken(token!);
      Get.offNamed(Routes.HOME);
    } catch (e) {
      Get.snackbar(
        'Ralat',
        e.toString(),
      );
    }
  }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Sila masukkan User Name';
    }
    return null;
  }

  String? validateEmel(String? value) {
    if (value == null || value.isEmpty) {
      return 'Sila masukkan Emel';
    }

    if (!GetUtils.isEmail(value)) return 'Emel tidak sah';
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Sila masukkan Password';
    }
    return null;
  }

  void toggleShowPassword() {
    passwordVisibleState.value = !passwordVisibleState.value;
  }
}
