import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/domain/entities/movie.dart';
import '../../../data/providers/movies_repository_provider.dart';


final movieInfoProvider = StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
  final getMovieById = ref.watch(movieRepositoryProvider).getMovieById;

  return MovieMapNotifier(getMovie: getMovieById);
});

/// State Class

typedef GetMovieCallback = Future<Movie>Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  final GetMovieCallback _getMovie;

  MovieMapNotifier({
    required GetMovieCallback getMovie,
  }) : _getMovie = getMovie, super({});

  Future<void> loadMovie(String movieId) async {
    if (state[movieId] != null) return;

    final movie = await _getMovie(movieId);

    state = { ...state, movieId: movie };
  }
}