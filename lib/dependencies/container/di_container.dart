import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:neobis_flutter_rick_and_morty/data/api/api_util.dart';
import 'package:neobis_flutter_rick_and_morty/data/api/service/service_api.dart';
import 'package:neobis_flutter_rick_and_morty/data/local/service/local_json_reader.dart';
import 'package:neobis_flutter_rick_and_morty/data/repository/service_data_repository.dart';

import 'package:neobis_flutter_rick_and_morty/presentation/main_page/provider_main_page/main_page_provider.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/models/characters_params.dart';

final getIt = GetIt.instance;
const String _base_url = "https://rickandmortyapi.com/api";

void setupDi() {
  getIt.registerSingleton<Dio>(Dio(BaseOptions(baseUrl: _base_url)));
  getIt.registerSingleton<CharactersParams>(CharactersParams(
      numberPage: 0, name: "", status: "", species: "", type: "", gender: ""));
  getIt.registerSingleton<RickAndMorthyService>(RickAndMorthyService());
  getIt.registerSingleton<ServiceDataRepository>(
      ServiceDataRepository(ApiUtil(RickAndMorthyService())));
  getIt.registerSingleton<GetData>(GetData());
  getIt.registerSingleton<MainPageProvider>(MainPageProvider());
}
