import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthService extends GetxService {
  final storageKey = 'TOKEN';
  final box = GetStorage();
  var formKey = GlobalKey<FormState>();

  bool get isAuthenticate => getToken()?.isNotEmpty ?? false;

  void saveToken(String token) {
    box.write(
      storageKey,
      token,
    );
  }

  String? getToken() {
    return box.read(storageKey);
  }

  void deleteToken() {
    box.remove(storageKey);
  }

  Map<String, String> getHeader() {
    final token = getToken();
    final headers = {
      "Authorization": "Bearer $token",
    };
    return headers;
  }
}
