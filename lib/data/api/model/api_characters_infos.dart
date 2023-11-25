import 'package:neobis_flutter_rick_and_morty/data/api/model/characters/api_character.dart';
import 'package:neobis_flutter_rick_and_morty/data/api/model/characters/api_character_info.dart';

class ApiInfosCharcaters {
  final ApiCharacterInfo info;
  final List<ApiCharacter> characters;

  ApiInfosCharcaters({
    required this.info,
    required this.characters,
  });
}
