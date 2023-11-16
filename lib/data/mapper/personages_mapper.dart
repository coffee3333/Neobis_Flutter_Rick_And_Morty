import 'package:neobis_flutter_rick_and_morty/domain/personage/personage.dart';

mixin PersonagesMapper {
  List<Personage> mapData({required List<dynamic> dataList}) {
    List<Personage> articles = [];
    for (var element in dataList) {
      final article = Personage.fromJson(element);
      articles.add(article);
    }
    return articles;
  }
}
