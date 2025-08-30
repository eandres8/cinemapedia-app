import 'package:cinemapedia/data/models/moviedb/credits_response.dart';
import 'package:cinemapedia/domain/entities/actor.dart';

// ignore: constant_identifier_names
const _PROFILE_EMPTY_PICTURE =
    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
    id: cast.id,
    name: cast.name,
    profilePath: (cast.profilePath != '')
        ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
        : _PROFILE_EMPTY_PICTURE,
    character: cast.character,
  );
}
