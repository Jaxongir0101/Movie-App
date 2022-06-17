import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';


import '../pages/details_page.dart';

class SecondSlider extends StatelessWidget {
  final Movie movie;
  final bool active;

  const SecondSlider(
    this.movie,
    this.active, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double margin = active ? 10 : 20;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailsPage(movie),
          ),
        );
      },
      child: AnimatedContainer(
        duration:const Duration(milliseconds: 900),
        curve: Curves.easeOutSine,
        margin: EdgeInsets.all(margin),
        decoration: BoxDecoration(
        
            image: DecorationImage(
                image: NetworkImage(
                    "http://image.tmdb.org/t/p/w500/${movie.posterPath}"))),
      ),
    );
    ;
  }


}
