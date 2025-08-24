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
    final response = await dio.get('/movie/now_playing', queryParameters: {
      'page': page,
    });
    final MovieDbResponse movieDBResponse = MovieDbResponse.fromJson(
      response.data,
    );

    return movieDBResponse.results;
  }
  
  @override
  Future<List<MovieMovieDB>> getPopular({int page = 1}) async {
    final response = await dio.get('/movie/popular', queryParameters: {
      'page': page,
    });
    final MovieDbResponse movieDBResponse = MovieDbResponse.fromJson(
      response.data,
    );

    return movieDBResponse.results;
  }
  
  @override
  Future<List<MovieMovieDB>> getTopRated({int page = 1}) async {
    final response = await dio.get('/movie/top_rated', queryParameters: {
      'page': page,
    });
    final MovieDbResponse movieDBResponse = MovieDbResponse.fromJson(
      response.data,
    );

    return movieDBResponse.results;
  }
  
  @override
  Future<List<MovieMovieDB>> getUpcoming({int page = 1}) async {
    final response = await dio.get('/movie/upcoming', queryParameters: {
      'page': page,
    });
    final MovieDbResponse movieDBResponse = MovieDbResponse.fromJson(
      response.data,
    );

    return movieDBResponse.results;
  }
}
