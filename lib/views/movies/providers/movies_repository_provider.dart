import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/data/services/moviedb_service.dart';
import 'package:cinemapedia/data/repositories/movie_repository_impl.dart';

/// Inmutable Repository
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviedbService());
});
