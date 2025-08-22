import 'package:cinemapedia/data/models/moviedb/movie_moviedb.dart';

abstract class MovieDatasource {
  Future<List<MovieMovieDB>> getNowPlaying({ int page = 1 });
}