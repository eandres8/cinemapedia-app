import 'package:cinemapedia/data/facades/http_client.dart';
import 'package:cinemapedia/data/models/moviedb/credits_response.dart';
import 'package:cinemapedia/data/services/actors/actors_datasource.dart';

class ActorsMoviedbServiceApi extends ActorsDatasource {
  final httpClient = DioHttpClient();
  
  @override
  Future<CreditsResponse> getActorsByMovie(String movieId) async {
    final resp = await httpClient.get('/movie/$movieId/credits');

    final data = CreditsResponse.fromJson(resp.data);

    return data;
  }
}