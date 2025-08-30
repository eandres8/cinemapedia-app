import 'package:cinemapedia/data/mappers/actor_mapper.dart';
import 'package:cinemapedia/data/services/actors/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'actors_repository.dart';

class ActorsMovieDbRepository extends ActorsRepository {
  final ActorsDatasource _datasource;

  ActorsMovieDbRepository({
    required ActorsDatasource datasource,
  }): _datasource = datasource;

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final data = await _datasource.getActorsByMovie(movieId);

    final List<Actor> actors = data.cast.map(ActorMapper.castToEntity).toList();

    return actors;
  }
}