import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import 'movie_provider.dart';
import 'movie.dart';

class MovieListWidget extends StatefulWidget {
  @override
  _MovieListWidgetState createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  @override
  void initState() {
    super.initState();
    Provider.of<MovieProvider>(context, listen: false).initialize();
  }
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



class MovieItemWidget extends StatelessWidget {
  final Movie movie;

   MovieItemWidget({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(movie.posterUrl, height: 150, fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(movie.title),
          ),
         
        ],
      ),
    );
  }
}
