import 'package:flutter/widgets.dart';
import 'package:movie_app/core/api_response.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/repositories/popular_repository.dart';

class MainViewModel extends ChangeNotifier {

  ApiResponse _apiResponse = ApiResponse.initial("Initial");

  ApiResponse get response {
    return _apiResponse;
  }

  List<Movie> _movies = [];

  List<Movie> get movies {
    return _movies;
  }

  Future<void> fetchPopular() async {
    try {
    List<Movie> movies = await PopularRepository().fetchPopular();
      _movies = movies;
      _apiResponse = ApiResponse.completed(movies);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
    }

    notifyListeners();
  }
}
