// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

class Movie {
  String? title;
  String? description;
  int? rating;
  String? imageURL;

  Movie({
    this.title,
    this.description,
    this.rating,
    this.imageURL,
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
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
    Movie(
        title: 'Tajuk 2',
        description: 'Detail 2',
        rating: 2,
        imageURL:
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg')
  ];

  final count = 0.obs;
  final keyword = ''.obs;
  //bool = true / false;
  //double = 1.0;
  //int = 1;
  //List = [];
  //num = 1 / 10.1;
  //final keyword = Rx<String>('');
  //final keyword = RxString('');

  List<Movie> get movieList {
    if (keyword.isEmpty) return movies;

    return movies
        .where((element) => element.title?.contains(keyword.value) ?? false)
        .toList();
  }

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
}
