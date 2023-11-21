import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:neobis_flutter_rick_and_morty/data/api/api_util.dart';
import 'package:neobis_flutter_rick_and_morty/data/api/request/get_character_body.dart';
import 'package:neobis_flutter_rick_and_morty/data/api/service/service_api.dart';
import 'package:neobis_flutter_rick_and_morty/data/local/service/local_json_reader.dart';
import 'package:neobis_flutter_rick_and_morty/domain/providers/main_page_provider.dart';

final getIt = GetIt.instance;
const String _base_url = "https://rickandmortyapi.com/api";

void setupDi() {
  getIt.registerSingleton<Dio>(Dio(BaseOptions(baseUrl: _base_url)));
  getIt.registerSingleton<RickAndMorthyService>(RickAndMorthyService());

  getIt.registerSingleton<GetData>(GetData());
  getIt.registerSingleton<MainPageProvider>(MainPageProvider());
  getIt.get<MainPageProvider>().updateList();

  getIt.registerSingleton<ApiUtil>(ApiUtil(getIt.get<RickAndMorthyService>()));
  print(getIt.get<ApiUtil>().getCharacters(
        numberPage: 1,
        name: "",
        status: "",
        species: "",
        type: "",
        gender: "",
      ));
}
