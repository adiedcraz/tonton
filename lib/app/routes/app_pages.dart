import 'package:get/get.dart';
import 'package:tonton/app/middlewares/auth_middleware.dart';

import 'package:tonton/app/modules/create_movie/bindings/create_movie_binding.dart';
import 'package:tonton/app/modules/create_movie/views/create_movie_view.dart';
import 'package:tonton/app/modules/home/bindings/home_binding.dart';
import 'package:tonton/app/modules/home/views/home_view.dart';
import 'package:tonton/app/modules/movie_detail/bindings/movie_detail_binding.dart';
import 'package:tonton/app/modules/movie_detail/views/movie_detail_view.dart';
import 'package:tonton/app/modules/movie_online/bindings/movie_online_binding.dart';
import 'package:tonton/app/modules/movie_online/views/movie_online_view.dart';
import 'package:tonton/app/modules/not_found/bindings/not_found_binding.dart';
import 'package:tonton/app/modules/not_found/views/not_found_view.dart';
import 'package:tonton/app/modules/register/bindings/register_binding.dart';
import 'package:tonton/app/modules/register/views/register_view.dart';
import 'package:tonton/app/modules/sample_navigation/bindings/sample_navigation_binding.dart';
import 'package:tonton/app/modules/sample_navigation/views/sample_navigation_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SAMPLE_NAVIGATION;
  static final UNKNOWN = GetPage(
    name: _Paths.NOT_FOUND,
    page: () => NotFoundView(),
    binding: NotFoundBinding(),
  );

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      //middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: _Paths.MOVIE_DETAIL,
      page: () => MovieDetailView(),
      binding: MovieDetailBinding(),
    ),
    GetPage(
      name: _Paths.SAMPLE_NAVIGATION,
      page: () => SampleNavigationView(),
      binding: SampleNavigationBinding(),
    ),
    GetPage(
      name: _Paths.NOT_FOUND,
      page: () => NotFoundView(),
      binding: NotFoundBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_MOVIE,
      page: () => CreateMovieView(),
      binding: CreateMovieBinding(),
    ),
    GetPage(
      name: _Paths.MOVIE_ONLINE,
      page: () => MovieOnlineView(),
      binding: MovieOnlineBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
  ];
}
