import 'package:neobis_flutter_rick_and_morty/domain/models/characters_infos.dart';

abstract class ServiceRepository {
  Future<CharactersInfos> getCharacters({
    required int numberPage,
    required String name,
    required String status,
    required String species,
    required String type,
    required String gender,
  });

  // Future<Map<String, dynamic>> getEpisodes({
  //   required List<int> episodes,
  // });
}
