// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../data/models/movie_model.dart' as model;

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    required this.movie,
    required this.onTap,
  }) : super(key: key);

  final model.Movie movie;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        title: Text(movie.name ?? ''),
        //subtitle: Text(movie.summary ?? '', overflow: TextOverflow.ellipsis),
        subtitle: Html(
          data: movie.summary,
        ),
        leading: Image.network(movie.image?.medium ??
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
            Text((movie.rating?.average ?? 0).toStringAsFixed(1)),
          ],
        ),
      ),
    );
  }
}
