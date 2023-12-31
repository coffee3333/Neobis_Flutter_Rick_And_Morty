import 'package:neobis_flutter_rick_and_morty/data/api/api_util.dart';
import 'package:neobis_flutter_rick_and_morty/domain/models/characters_infos.dart';
import 'package:neobis_flutter_rick_and_morty/domain/repository/service_repository.dart';

class ServiceDataRepository extends ServiceRepository {
  final ApiUtil _apiUtil;

  ServiceDataRepository(this._apiUtil);
  // for understanding domain layer need to refactor this data layer and add a mapper wich will replace data with domain layer models and return for domain layer
  @override
  Future<CharactersInfos> getCharacters({
    required int numberPage,
    required String name,
    required String status,
    required String species,
    required String type,
    required String gender,
  }) {
    return _apiUtil.getCharacters(
      numberPage: numberPage,
      name: name,
      status: status,
      species: species,
      type: type,
      gender: gender,
    );
  }

  // @override
  // Future<Map<String, dynamic>> getEpisodes({required List<int> episodes}) {
  //   // TODO: implement getEpisodes
  //   throw UnimplementedError();
  // }
}
