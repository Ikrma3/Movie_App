import 'dart:convert';
import 'package:http/http.dart' as http;
import 'movie.dart';

class MovieService {
  static const String apiKey = '63a30199a72ee422fa566130213ae676';
  static const String baseUrl = 'https://api.themoviedb.org/3';

  Future<List<Movie>> fetchMovies() async {
     print('Fetching movies...');
    final response = await http.get(Uri.parse('$baseUrl/discover/movie?api_key=$apiKey'));
    
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> moviesData = data['results'];
      return moviesData.map((movieData) => Movie(
  id: movieData['id'].toString(), 
  title: movieData['title'],
  releaseDate: DateTime.parse(movieData['release_date']),
  overview: movieData['overview'],
  posterUrl: 'https://image.tmdb.org/t/p/w500${movieData['poster_path']}',
)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
