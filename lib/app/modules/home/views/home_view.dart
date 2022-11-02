import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextField(
            decoration: InputDecoration(
              icon: Icon(Icons.search),
              hintText: 'Cari',
            ),
            onChanged: controller.onSearch,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: controller.filter,
              icon: Icon(Icons.filter_alt),
            )
          ],
        ),
        body: Obx(
          () => controller.movieList.isEmpty
              ? Center(
                  child: Text(
                    'Tiada Rekod.',
                    style: TextStyle(color: Colors.redAccent, fontSize: 20),
                  ),
                )
              : ListView.builder(
                  itemCount: controller.movieList.length,
                  itemBuilder: (context, index) {
                    final movie = controller.movieList[index];

                    return Card(
                      child: ListTile(
                        title: Text(movie.title ?? ''),
                        subtitle: Text(movie.description ?? '',
                            overflow: TextOverflow.ellipsis),
                        leading: Image.network(movie.imageURL ??
                            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                        //trailing: Text('${movie.rating}'),
                        //trailing: Text(movie.rating.toString()),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Icon(
                                Icons.star,
                                color: Colors.deepOrange,
                                size: 24.0,
                              ),
                            ),
                            Text((movie.rating ?? 0).toStringAsFixed(1)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ));
  }
}
