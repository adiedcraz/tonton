import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import '../../services/auth_services.dart';
import '../models/user_model.dart';

class UserProvider extends GetConnect {
  final _authService = Get.find<AuthService>();

  @override
  void onInit() {
    // httpClient.defaultDecoder = (map) {
    //   if (map is Map<String, dynamic>) return User.fromJson(map);
    //   if (map is List) return map.map((item) => User.fromJson(item)).toList();
    // };
    httpClient.baseUrl = dotenv.env['AUTH_ENDPOINT'];
  }

  Future<User?> getUser() async {
    final headers = _authService.getHeader();

    final response = await get(
      'user',
      headers: headers,
      decoder: (data) => User.fromJson(data['data']),
    );
    return response.body;
  }

  Future<dynamic> home() async {
    try {
      final response = await get('home');
      print(response.request?.method);
      print(response.request?.url);
      print(response.headers);
      print(response.statusCode);
      print(response.body);
      return response.body;
    } catch (e) {
      print(e);
    }
  }

//bwh ni sepatutnya letak kat provider lain
  Future<String?> loginUser(User user) async {
    final response = await post('login', user);
    return response.body;
  }

  Future<String?> addUser(User user) async {
    // try {
    //   print(user.toJson());
    //   final response = await post('register', user.toJson());
    //   print(response.body);
    //   if (!response.body['success']) throw response.body['error'];
    //   return response.body['data'];
    // } catch (e) {
    //   print(e);
    // }

    final response = {
      "success": true,
      "data":
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2Njc3OTEyODEsImlhdCI6MTY2NzUzMjA4MSwiaXNzIjoiRmx1dHRlclNlcnZlciIsInN1YiI6Im5AZ21haWwuY29tIn0.43OsuLkUt8uyeL6-LpKPgkRfE76yabHdYeziv2D9zf0"
    };

    // if (!response['success']) throw response['error'];
    return 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2Njc3OTEyODEsImlhdCI6MTY2NzUzMjA4MSwiaXNzIjoiRmx1dHRlclNlcnZlciIsInN1YiI6Im5AZ21haWwuY29tIn0.43OsuLkUt8uyeL6-LpKPgkRfE76yabHdYeziv2D9zf0';
  }

  //Future<Response> deleteUser(int id) async => await delete('user/$id');
}
