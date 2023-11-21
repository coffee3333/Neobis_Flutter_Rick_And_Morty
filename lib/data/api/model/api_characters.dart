import 'package:neobis_flutter_rick_and_morty/data/api/model/characters/api_character.dart';
import 'package:neobis_flutter_rick_and_morty/data/api/model/characters/api_info.dart';

class ApiCharcaters {
  final ApiInfo info;
  final List<ApiCharacter> characters;

  ApiCharcaters({
    required this.info,
    required this.characters,
  });
}
