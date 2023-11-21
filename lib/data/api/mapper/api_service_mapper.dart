import 'package:neobis_flutter_rick_and_morty/data/api/model/characters/api_character.dart';
import 'package:neobis_flutter_rick_and_morty/data/api/model/api_episode.dart';

mixin ApiServiceMapper {
  List<ApiCharacter> toListCharacters(Map<String, dynamic> data) {
    List<ApiCharacter> characters = [];
    for (var character in data["results"]) {
      characters.add(ApiCharacter.fromApi(character));
    }
    return characters;
  }

  List<ApiEpisode> toListEpisodes(List<dynamic> data) {
    List<ApiEpisode> episodes = [];
    for (var episode in data) {
      episodes.add(ApiEpisode.fromApi(episode));
    }
    return episodes;
  }
}
