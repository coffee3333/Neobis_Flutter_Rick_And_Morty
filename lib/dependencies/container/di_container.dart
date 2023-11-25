import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:neobis_flutter_rick_and_morty/data/api/api_util.dart';
import 'package:neobis_flutter_rick_and_morty/data/api/model/characters/api_character_info.dart';
import 'package:neobis_flutter_rick_and_morty/data/api/service/service_api.dart';
import 'package:neobis_flutter_rick_and_morty/data/local/service/local_json_reader.dart';
import 'package:neobis_flutter_rick_and_morty/data/repository/service_data_repository.dart';

import 'package:neobis_flutter_rick_and_morty/domain/providers/main_page_provider.dart';

final getIt = GetIt.instance;
const String _base_url = "https://rickandmortyapi.com/api";

void setupDi() {
  getIt.registerSingleton<Dio>(Dio(BaseOptions(baseUrl: _base_url)));
  getIt.registerSingleton<RickAndMorthyService>(RickAndMorthyService());
  getIt.registerSingleton<ServiceDataRepository>(
      ServiceDataRepository(ApiUtil(RickAndMorthyService())));
  getIt.registerSingleton<GetData>(GetData());
  getIt.registerSingleton<MainPageProvider>(MainPageProvider());
}
