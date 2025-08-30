import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/data/providers/actors_repository_provider.dart';


final actorsByMovieProvider = StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>((ref) {
  final getActorsByMovie = ref.watch(actorsRepositoryProvider).getActorsByMovie;

  return ActorsByMovieNotifier(getActors: getActorsByMovie);
});

/// State Class

typedef GetActorsCallback = Future<List<Actor>>Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallback _getActors;

  ActorsByMovieNotifier({
    required GetActorsCallback getActors,
  }) : _getActors = getActors, super({});

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;

    final actors = await _getActors(movieId);

    state = { ...state, movieId: actors };
  }
}