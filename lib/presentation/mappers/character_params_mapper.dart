import 'package:neobis_flutter_rick_and_morty/domain/models/get_characters_params.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/models/characters_params.dart';

class CharacterParamsMapper {
  static GetCharactersParams map(CharactersParams params) {
    return GetCharactersParams(
      numberPage: params.numberPage,
      name: params.name,
      status: params.status,
      species: params.species,
      type: params.type,
      gender: params.gender,
    );
  }
}
