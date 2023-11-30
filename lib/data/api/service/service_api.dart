import 'package:dio/dio.dart';
import 'package:neobis_flutter_rick_and_morty/data/api/mapper/api_service_mapper.dart';
import 'package:neobis_flutter_rick_and_morty/data/api/model/api_characters_infos.dart';
import 'package:neobis_flutter_rick_and_morty/data/api/model/api_episode.dart';
import 'package:neobis_flutter_rick_and_morty/data/api/model/characters/api_character_info.dart';
import 'package:neobis_flutter_rick_and_morty/data/api/request/get_character_body.dart';
import 'package:neobis_flutter_rick_and_morty/data/api/request/get_episode_body.dart';
import 'package:neobis_flutter_rick_and_morty/dependencies/container/di_container.dart';

class RickAndMorthyService with ApiServiceMapper {
  // Response<dynamic> _getResponce ({required String path, required Map <String, dynamic> params}) async {

  //   try {
  //     final responce = await getIt.get<Dio>().get(path, queryParameters: params);
  //     if (responce.statusCode == 200){
  //       return responce;
  //     }

  //   } catch (error){

  //   }
  // }

  Future<ApiInfosCharcaters> getDataCharacters(GetCharacterBody body) async {
    final response = await getIt.get<Dio>().get(
          '/character/',
          queryParameters: body.toApi(),
        );
    return ApiInfosCharcaters(
      info: ApiCharacterInfo.fromApi(response.data),
      characters: toListCharacters(response.data),
    );

    // Tryed to write here exception, but need to rewrite all models
    // try {
    //   final response = await getIt
    //       .get<Dio>()
    //       .get('/character/', queryParameters: body.toApi(), options: Options(followRedirects: false, validateStatus: (status) => status < 500,));
    //   if (response.statusCode == 200) {
    //     return ApiInfosCharcaters(
    //       info: ApiCharacterInfo.fromApi(response.data),
    //       characters: toListCharacters(response.data),
    //     );
    //   }
    //   else if (response.statusCode == 404){

    //   }
    //   // return ApiInfosCharcaters(dioStatus: 0, info: null, characters: null);
    // }  catch (error) {
    //   if (error is DioException) {
    //     if (error.response != null) {
    //       int errorCode = error.response!.statusCode ?? 0;
    //       return ApiInfosCharcaters(
    //           dioStatus: errorCode, info: null, characters: null);
    //     }
    //   }
    // }
  }

  Future<List<ApiEpisode>> getDataEpisodes(GetEpisodeBody body) async {
    final response = await getIt.get<Dio>().get('/episode/${body.toApi()}');

    return toListEpisodes(response.data);
  }
}
