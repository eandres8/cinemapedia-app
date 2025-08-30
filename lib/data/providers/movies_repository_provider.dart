import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/data/services/movies/moviedb_service_api.dart';
import 'package:cinemapedia/data/repositories/movies/movie_moviedb_api.dart';

/// Inmutable Repository
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryApi(datasource:  MoviedbService());
});
