import 'package:flutter/material.dart';
import 'package:movie_app/movie_list_widget';
import 'package:provider/provider.dart';
import 'movie.dart';
import 'movie_provider.dart'; // Make sure to import your Movie class

class _MovieListWidgetState extends State<MovieListWidget> {
  @override
  void initState() {
    super.initState();
    Provider.of<MovieProvider>(context, listen: false).fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie List'),
      ),
      body: Consumer<MovieProvider>(
        builder: (context, movieProvider, _) {
          if (movieProvider.movies.isEmpty) {
            return CircularProgressIndicator();
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 4,
              ),
              itemCount: movieProvider.movies.length,
              itemBuilder: (context, index) {
                final movie = movieProvider.movies[index];
                return MovieItemWidget(movie: movie);
              },
            );
          }
        },
      ),
    );
  }
}
