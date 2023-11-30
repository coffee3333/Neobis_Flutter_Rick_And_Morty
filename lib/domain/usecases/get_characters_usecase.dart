import 'package:neobis_flutter_rick_and_morty/domain/models/characters_infos.dart';
import 'package:neobis_flutter_rick_and_morty/domain/models/get_characters_params.dart';
import 'package:neobis_flutter_rick_and_morty/domain/repository/service_repository.dart';

class GetCharacterUseCase {
  final ServiceRepository _repository;

  GetCharacterUseCase({required ServiceRepository repository})
      : _repository = repository;

  Future<CharactersInfos> call(GetCharactersParams params) {
    return _repository.getCharacters(
      numberPage: params.numberPage,
      name: params.name,
      status: params.status,
      species: params.species,
      type: params.type,
      gender: params.gender,
    );
  }
}
