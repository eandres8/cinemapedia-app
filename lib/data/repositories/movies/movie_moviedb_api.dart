import 'package:cinemapedia/data/models/moviedb/movie_moviedb.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/data/mappers/movie_mapper.dart';
import 'package:cinemapedia/data/services/movies/movies_datasource.dart';
import 'package:cinemapedia/data/repositories/movies/movies_repository.dart';

class MovieRepositoryApi extends MovieRepository {
  final MovieDatasource _datasource;

  MovieRepositoryApi({ required MovieDatasource datasource }): _datasource = datasource;

  List<Movie> _jsonToMovies(List<MovieMovieDB> data) {
    return data
      .where((moviedb) => moviedb.posterPath != 'no-poster')
      .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
      .toList();
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final data = await _datasource.getNowPlaying(page: page);

    final List<Movie> movies = _jsonToMovies(data);

    return movies;
  }
  
  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final data = await _datasource.getPopular(page: page);

    final List<Movie> movies = _jsonToMovies(data);

    return movies;
  }
  
  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
   final data = await _datasource.getTopRated(page: page);

    final List<Movie> movies = _jsonToMovies(data);

    return movies;
  }
  
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final data = await _datasource.getUpcoming(page: page);

    final List<Movie> movies = _jsonToMovies(data);

    return movies;
  }
  
  @override
  Future<Movie> getMovieById(String id) async {
    final data = await _datasource.getMovieById(id);

    final movie = MovieMapper.movieDetailToEntity(data);

    return movie;
  }
}