import 'package:neobis_flutter_rick_and_morty/data/api/model/api_characters.dart';
import 'package:neobis_flutter_rick_and_morty/data/api/model/api_episode.dart';
import 'package:neobis_flutter_rick_and_morty/data/api/request/get_character_body.dart';
import 'package:neobis_flutter_rick_and_morty/data/api/request/get_episode_body.dart';
import 'package:neobis_flutter_rick_and_morty/data/api/service/service_api.dart';

class ApiUtil {
  final RickAndMorthyService _rickAndMorthyService;
  ApiUtil(this._rickAndMorthyService);

  Future<ApiCharcaters> getCharacters({
    required int numberPage,
    required String name,
    required String status,
    required String species,
    required String type,
    required String gender,
  }) async {
    final body = GetCharacterBody(
      numberPage: numberPage,
      name: name,
      status: status,
      species: species,
      type: type,
      gender: gender,
    );

    final result = await _rickAndMorthyService.getDataCharacters(body);

    //Just for checking data
    result.characters.forEach((element) {
      print(element.name);
    });

    return result;
  }

  Future<List<ApiEpisode>> getEpisodes({required List<int> episodes}) async {
    final body = GetEpisodeBody(episodes: episodes);

    final result = await _rickAndMorthyService.getDataEpisodes(body);

    //Just for checking data
    result.forEach((episode) {
      print(episode.name);
    });

    return result;
  }
}
