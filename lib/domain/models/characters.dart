import 'package:neobis_flutter_rick_and_morty/domain/models/character_models/character.dart';
import 'package:neobis_flutter_rick_and_morty/domain/models/character_models/chracters_info.dart';

class Characters {
  final CharacterInfo info;
  final List<Character> characters;

  Characters({
    required this.info,
    required this.characters,
  });
}
