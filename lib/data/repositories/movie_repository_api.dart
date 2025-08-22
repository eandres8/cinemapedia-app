import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/data/mappers/movie_mapper.dart';
import 'package:cinemapedia/data/services/movies_datasource.dart';
import 'package:cinemapedia/data/repositories/movies_repository.dart';

class MovieRepositoryApi extends MovieRepository {
  final MovieDatasource datasource;

  MovieRepositoryApi(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final data = await datasource.getNowPlaying(page: page);

    final List<Movie> movies = data
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();

    return movies;
  }
}