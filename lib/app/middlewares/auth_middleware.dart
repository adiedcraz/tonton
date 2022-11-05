import 'package:get/get.dart';
import 'package:tonton/app/services/auth_services.dart';

import '../routes/app_pages.dart';

class AuthMiddleware extends GetMiddleware {
  final _authService = Get.find<AuthService>();

  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    if (!_authService.isAuthenticate) {
      final newRoute = Routes.REGISTER;
      return GetNavConfig.fromRoute(newRoute);
    }
    return await super.redirectDelegate(route);
  }
}
