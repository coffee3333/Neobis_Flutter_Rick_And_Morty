import 'package:dio/dio.dart';
import 'package:neobis_flutter_rick_and_morty/data/api/mapper/api_service_mapper.dart';
import 'package:neobis_flutter_rick_and_morty/data/api/model/api_characters_infos.dart';
import 'package:neobis_flutter_rick_and_morty/data/api/model/api_episode.dart';
import 'package:neobis_flutter_rick_and_morty/data/api/model/characters/api_character_info.dart';
import 'package:neobis_flutter_rick_and_morty/data/api/request/get_character_body.dart';
import 'package:neobis_flutter_rick_and_morty/data/api/request/get_episode_body.dart';
import 'package:neobis_flutter_rick_and_morty/dependencies/container/di_container.dart';

class RickAndMorthyService with ApiServiceMapper {
  Future<ApiInfosCharcaters> getDataCharacters(GetCharacterBody body) async {
    try {
      final response = await getIt.get<Dio>().get(
            '/character/',
            queryParameters: body.toApi(),
          );

      return ApiInfosCharcaters(
        info: ApiCharacterInfo.fromApi(response.data),
        characters: toListCharacters(response.data),
      );
    } on DioException {
      rethrow;
    }
  }

  Future<List<ApiEpisode>> getDataEpisodes(GetEpisodeBody body) async {
    final response = await getIt.get<Dio>().get('/episode/${body.toApi()}');

    return toListEpisodes(response.data);
  }
}
