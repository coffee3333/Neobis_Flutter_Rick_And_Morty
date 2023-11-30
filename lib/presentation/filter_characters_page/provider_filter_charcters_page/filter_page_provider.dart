import 'package:flutter/foundation.dart';
import 'package:neobis_flutter_rick_and_morty/dependencies/container/di_container.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/models/characters_params.dart';

class FilterPageProvider extends ChangeNotifier {
  FilterPageProvider() {
    print(getIt.get<CharactersParams>().numberPage = 0);
    print(getIt.get<CharactersParams>().name);
    print(getIt.get<CharactersParams>().gender);
    print(getIt.get<CharactersParams>().status);
  }
}
