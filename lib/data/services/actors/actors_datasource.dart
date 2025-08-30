import 'package:cinemapedia/data/models/moviedb/credits_response.dart';

abstract class ActorsDatasource {
  Future <CreditsResponse> getActorsByMovie(String movieId);
}
