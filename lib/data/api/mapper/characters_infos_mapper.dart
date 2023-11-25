import 'package:neobis_flutter_rick_and_morty/data/api/mapper/character_info_mapper.dart';
import 'package:neobis_flutter_rick_and_morty/data/api/mapper/character_mapper.dart';
import 'package:neobis_flutter_rick_and_morty/data/api/model/api_characters_infos.dart';
import 'package:neobis_flutter_rick_and_morty/data/api/model/characters/api_character.dart';
import 'package:neobis_flutter_rick_and_morty/domain/models/character_models/character.dart';
import 'package:neobis_flutter_rick_and_morty/domain/models/characters_infos.dart';

class CharactersInfosMapper {
  static CharactersInfos fromApi(ApiInfosCharcaters apiCharacters) {
    return CharactersInfos(
      info: CharacterInfoMapper.fromApi(apiCharacters.info),
      characters: _fromApiCharacters(apiCharacters.characters),
    );
  }

  static List<Character> _fromApiCharacters(
      List<ApiCharacter> listApiCharacters) {
    List<Character> characters = [];
    for (var character in listApiCharacters) {
      characters.add(CharacterMapper.fromApi(character));
    }
    return characters;
  }
}
