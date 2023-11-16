import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:neobis_flutter_rick_and_morty/data/local/service/local_json_reader.dart';
import 'package:neobis_flutter_rick_and_morty/data/mapper/personages_mapper.dart';
import 'package:neobis_flutter_rick_and_morty/dependencies/container/di_container.dart';
import 'package:neobis_flutter_rick_and_morty/domain/personage/personage.dart';

class MainPageProvider extends ChangeNotifier with PersonagesMapper {
  List<Personage> personages = [];
  final service = getIt.get<GetData>();

  String _searchingPersonage = '';

  int get lengthPersonages => personages.length;

  void changeSearchPersonage(String searchingPersonage) {
    _searchingPersonage = searchingPersonage;
    print(_searchingPersonage);
    // notifyListeners();
  }

  String getName(int index) {
    return personages[index].name;
  }

  void updateList() async {
    personages = mapData(dataList: await service.readJson());
    notifyListeners();
  }
}
