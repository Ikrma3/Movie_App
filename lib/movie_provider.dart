import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'movie.dart';
import 'movie_screen.dart'; 

class MovieProvider extends ChangeNotifier {
  final MovieService _movieService = MovieService();
  List<Movie> _movies = [];

  List<Movie> get movies => _movies;

  Future<void> fetchMovies() async {
    print('Fetching movies in MovieProvider...');
    _movies = await _movieService.fetchMovies();
    print('Fetched ${_movies.length} movies in MovieProvider');
    notifyListeners();
  }
 Future<void> initialize() async {
    await fetchMovies();
  }
  getFavoriteMovies() {}
}
