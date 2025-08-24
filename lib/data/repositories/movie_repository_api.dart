import 'package:cinemapedia/data/models/moviedb/movie_moviedb.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/data/mappers/movie_mapper.dart';
import 'package:cinemapedia/data/services/movies_datasource.dart';
import 'package:cinemapedia/data/repositories/movies_repository.dart';

class MovieRepositoryApi extends MovieRepository {
  final MovieDatasource datasource;

  MovieRepositoryApi(this.datasource);

  List<Movie> _jsonToMovies(List<MovieMovieDB> data) {
    return data
      .where((moviedb) => moviedb.posterPath != 'no-poster')
      .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
      .toList();
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final data = await datasource.getNowPlaying(page: page);

    final List<Movie> movies = _jsonToMovies(data);

    return movies;
  }
  
  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final data = await datasource.getPopular(page: page);

    final List<Movie> movies = _jsonToMovies(data);

    return movies;
  }
  
  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
   final data = await datasource.getTopRated(page: page);

    final List<Movie> movies = _jsonToMovies(data);

    return movies;
  }
  
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final data = await datasource.getUpcoming(page: page);

    final List<Movie> movies = _jsonToMovies(data);

    return movies;
  }
}