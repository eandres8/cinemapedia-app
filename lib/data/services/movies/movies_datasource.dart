import 'package:cinemapedia/data/models/moviedb/movie_details_api.dart';
import 'package:cinemapedia/data/models/moviedb/movie_moviedb.dart';

abstract class MovieDatasource {
  Future<List<MovieMovieDB>> getNowPlaying({ int page = 1 });
  Future<List<MovieMovieDB>> getPopular({ int page = 1 });
  Future<List<MovieMovieDB>> getTopRated({ int page = 1 });
  Future<List<MovieMovieDB>> getUpcoming({ int page = 1 });
  Future<MovieDetailsApi> getMovieById(String id);
}