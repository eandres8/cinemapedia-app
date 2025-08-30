import 'package:cinemapedia/data/facades/http_client.dart';
import 'package:cinemapedia/data/models/moviedb/movie_details_api.dart';
import 'package:cinemapedia/data/services/movies/movies_datasource.dart';
import 'package:cinemapedia/data/models/moviedb/movie_moviedb.dart';
import 'package:cinemapedia/data/models/moviedb/moviedb_response.dart';

class MoviedbService extends MovieDatasource {
  final httpClient = DioHttpClient();

  @override
  Future<List<MovieMovieDB>> getNowPlaying({int page = 1}) async {
    final response = await httpClient.get('/movie/now_playing', queryParameters: {
      'page': page,
    });
    final MovieDbResponse movieDBResponse = MovieDbResponse.fromJson(
      response.data,
    );

    return movieDBResponse.results;
  }
  
  @override
  Future<List<MovieMovieDB>> getPopular({int page = 1}) async {
    final response = await httpClient.get('/movie/popular', queryParameters: {
      'page': page,
    });
    final MovieDbResponse movieDBResponse = MovieDbResponse.fromJson(
      response.data,
    );

    return movieDBResponse.results;
  }
  
  @override
  Future<List<MovieMovieDB>> getTopRated({int page = 1}) async {
    final response = await httpClient.get('/movie/top_rated', queryParameters: {
      'page': page,
    });
    final MovieDbResponse movieDBResponse = MovieDbResponse.fromJson(
      response.data,
    );

    return movieDBResponse.results;
  }
  
  @override
  Future<List<MovieMovieDB>> getUpcoming({int page = 1}) async {
    final response = await httpClient.get('/movie/upcoming', queryParameters: {
      'page': page,
    });
    final MovieDbResponse movieDBResponse = MovieDbResponse.fromJson(
      response.data,
    );

    return movieDBResponse.results;
  }
  
  @override
  Future<MovieDetailsApi> getMovieById(String id) async {
    final response = await httpClient.get('/movie/$id');
    final MovieDetailsApi movieDBResponse = MovieDetailsApi.fromJson(
      response.data,
    );

    return movieDBResponse;
  }
}
