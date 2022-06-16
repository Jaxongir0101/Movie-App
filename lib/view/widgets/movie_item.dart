import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movie_app/view/pages/details_page.dart';

class MovieItem extends StatefulWidget {
  final Movie movie;
  const MovieItem(
    this.movie, {
    Key? key,
  }) : super(key: key);

  @override
  State<MovieItem> createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailsPage(widget.movie),
          ),
        );
      },
      child: Stack(children: [
        Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          borderOnForeground: true,
          child: Image.network(
            "http://image.tmdb.org/t/p/w500/${widget.movie.posterPath}",
            height: 500,
            fit: BoxFit.cover,
          ),
          elevation: 12,
          shadowColor: Colors.white,
          color: Colors.white,
          margin: const EdgeInsets.all(15),
        ),
        Positioned(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              Icon(
                Icons.play_circle_fill_outlined,
                size: 52,
                color: Colors.white,
              )
            ],
          ),
        )
      ]),
    );
  }
}
