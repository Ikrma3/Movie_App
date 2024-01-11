class Movie {
  final String id;
  final String title;
  final DateTime releaseDate;
  final String overview;
  final String posterUrl;
  bool isFavorite;

  Movie({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.overview,
    required this.posterUrl,
    this.isFavorite = false,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'].toString(),
      title: json['title'],
      releaseDate: DateTime.parse(json['release_date']),
      overview: json['overview'],
      posterUrl: 'https://image.tmdb.org/t/p/w500${json['poster_path']}',
    );
  }
  factory Movie.fromJsonWithHandling(Map<String, dynamic> json) {
    try {
      return Movie.fromJson(json);
    } catch (e) {
      print('Error creating Movie from JSON: $e');
      throw Exception('Failed to create Movie from JSON');
    }
  }
}
