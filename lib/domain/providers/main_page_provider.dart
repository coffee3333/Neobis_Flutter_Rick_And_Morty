import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:neobis_flutter_rick_and_morty/data/local/service/local_json_reader.dart';
import 'package:neobis_flutter_rick_and_morty/data/mapper/personages_mapper.dart';
import 'package:neobis_flutter_rick_and_morty/dependencies/container/di_container.dart';
import 'package:neobis_flutter_rick_and_morty/domain/personage/personage.dart';

class MainPageProvider extends ChangeNotifier with PersonagesMapper {
  bool _isGrid = false;
  List<Personage> _personages = [];
  List<Personage> personagesFiltered = [];
  List<Personage> personagesSearched = [];

  final service = getIt.get<GetData>();

  String _searchingPersonage = '';

  int get lengthPersonages => personagesSearched.length;
  bool get searchBarNotActive => _searchingPersonage.isEmpty;
  bool get isGridActive => _isGrid;

  void changeSearchPersonage(String searchingPersonage) {
    _searchingPersonage = searchingPersonage;
    _searchingPersonage.isNotEmpty
        ? personagesSearched = personagesFiltered
            .where((personage) => personage.name
                .toLowerCase()
                .contains(_searchingPersonage.toLowerCase()))
            .toList()
        : personagesSearched = personagesFiltered;
    notifyListeners();
  }

  void updateList() async {
    _personages = mapData(dataList: await service.readJson());
    personagesFiltered = _personages;
    personagesSearched = personagesFiltered;
    notifyListeners();
  }

  void changeViewContentToGrid() {
    _isGrid = false;
    notifyListeners();
  }

  void changeViewContentToList() {
    _isGrid = true;
    notifyListeners();
  }

  Personage getPersonage(index) {
    return personagesSearched[index];
  }
}
