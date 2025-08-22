import 'package:dio/dio.dart';

import 'package:cinemapedia/data/services/movies_datasource.dart';
import 'package:cinemapedia/data/models/moviedb/movie_moviedb.dart';
import 'package:cinemapedia/data/models/moviedb/moviedb_response.dart';
import 'package:cinemapedia/config/constants/environment.dart';

class MoviedbService extends MovieDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDBKey,
        'language': 'es-MX',
      },
    ),
  );

  @override
  Future<List<MovieMovieDB>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');
    final MovieDbResponse movieDBResponse = MovieDbResponse.fromJson(
      response.data,
    );

    return movieDBResponse.results;
  }
}
