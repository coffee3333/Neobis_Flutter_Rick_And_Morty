import 'package:neobis_flutter_rick_and_morty/data/api/model/characters/api_character.dart';
import 'package:neobis_flutter_rick_and_morty/domain/models/character_models/character.dart';

class CharacterMapper {
  static Character fromApi(ApiCharacter character) {
    return Character(
      id: character.id,
      status: character.status,
      name: character.name,
      species: character.species,
      gender: character.gender,
      originName: character.originName,
      locationName: character.locationName,
      image: character.image,
      episodes: _getPages(character.episodes),
    );
  }

  static List<int> _getPages(List<dynamic> links) {
    List<int> answers = [];
    for (var link in links) {
      answers.add(_getValueFromLink(link));
    }
    return answers;
  }

  static int _getValueFromLink(String link) {
    List<String> splitedLink = link.split("/");
    return int.parse(splitedLink.last);
  }
}
