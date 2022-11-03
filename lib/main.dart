import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  await GetStorage.init();
  runApp(
    DevicePreview(
      //enabled: !kReleaseMode,
      enabled: false,
      builder: (context) => App(), // Wrap your app
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      unknownRoute: AppPages.UNKNOWN,
      getPages: AppPages.routes,
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        cardTheme: CardTheme(
          color: Colors.blueGrey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
        ),
      ),
    );
  }
}
