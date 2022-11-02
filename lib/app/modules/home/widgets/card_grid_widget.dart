import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';

class CardGridWidget extends StatelessWidget {
  const CardGridWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    const radius = 20.0;
    //final borderRadius = BorderRadius.only(bottomRight: );

    return Card(
      child: GridTile(
        footer: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Text(movie.title! + 'etwetwetwetwetwe ewtwetewtrewt',
                    overflow: TextOverflow.ellipsis),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Icon(
                      Icons.star,
                      size: 24.0,
                    ),
                  ),
                  Text((movie.rating ?? 0).toStringAsFixed(1)),
                ],
              ),
            ],
          ),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(radius),
              bottomLeft: Radius.circular(radius),
            ),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Image.network(movie.imageURL!),
        ),
      ),
    );
  }
}
