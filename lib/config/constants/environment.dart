import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String theMovieDBKey = dotenv.get('THE_MOVIEDB_KEY', fallback: '');
}