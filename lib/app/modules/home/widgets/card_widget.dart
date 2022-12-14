// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    required this.movie,
    required this.onTap,
  }) : super(key: key);

  final Movie movie;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        title: Text(movie.title ?? ''),
        subtitle:
            Text(movie.description ?? '', overflow: TextOverflow.ellipsis),
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
  }
}
