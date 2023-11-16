import 'package:get_it/get_it.dart';
import 'package:neobis_flutter_rick_and_morty/data/local/service/local_json_reader.dart';
import 'package:neobis_flutter_rick_and_morty/domain/providers/main_page_provider.dart';

final getIt = GetIt.instance;

void setupDi() {
  getIt.registerSingleton<GetData>(GetData());
  getIt.registerSingleton<MainPageProvider>(MainPageProvider());
  getIt.get<MainPageProvider>().updateList();
}
