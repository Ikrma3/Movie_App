import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'movie_provider.dart';

class FavoriteMoviesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoriteMovies = Provider.of<MovieProvider>(context).getFavoriteMovies();

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Movies'),
      ),
      body: ListView.builder(
        itemCount: favoriteMovies.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favoriteMovies[index].title),
            subtitle: Text(favoriteMovies[index].releaseDate.toString()),
          );
        },
      ),
    );
  }
}
