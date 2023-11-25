import 'package:neobis_flutter_rick_and_morty/data/api/model/characters/api_character_info.dart';
import 'package:neobis_flutter_rick_and_morty/domain/models/character_models/chracters_info.dart';

class CharacterInfoMapper {
  static CharacterInfo fromApi(ApiCharacterInfo characterInfo) {
    return CharacterInfo(
      quantity: characterInfo.quantity,
      pages: characterInfo.pages,
      nextPage: _getPageNum(characterInfo.nextPage),
      prevPage: _getPageNum(characterInfo.prevPage),
    );
  }

  static dynamic _getPageNum(String url) {
    Uri uri = Uri.parse(url);

    String? pageValue = uri.queryParameters['page'];

    if (pageValue != null) {
      return int.tryParse(pageValue) ?? 0;
    }
    return null;
  }
}
