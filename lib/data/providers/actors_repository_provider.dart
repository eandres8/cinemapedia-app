import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/data/repositories/actors/actors_moviedb_repository.dart';
import 'package:cinemapedia/data/services/actors/actors_moviedb_service_api.dart';

/// Inmutable Repository
final actorsRepositoryProvider = Provider((ref) {
  return ActorsMovieDbRepository(datasource:  ActorsMoviedbServiceApi());
});