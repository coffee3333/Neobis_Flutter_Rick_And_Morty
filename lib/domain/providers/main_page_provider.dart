import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:neobis_flutter_rick_and_morty/data/repository/service_data_repository.dart';
import 'package:neobis_flutter_rick_and_morty/dependencies/container/di_container.dart';
import 'package:neobis_flutter_rick_and_morty/domain/models/character_models/character.dart';
import 'package:neobis_flutter_rick_and_morty/domain/models/characters_infos.dart';
import 'package:neobis_flutter_rick_and_morty/domain/repository/service_repository.dart';

class MainPageProvider extends ChangeNotifier {
  final ServiceRepository _service = getIt.get<ServiceDataRepository>();
  late CharactersInfos charactersInfos;

  bool _isGrid = false;
  bool _isLoading = true;
  bool _isNoData = false;
  bool _isProblemsService = false;

  String _name = "";
  String _status = "";
  String _species = "";
  String _type = "";
  String _gender = "";
  late List<Character> characters;
  late List<Character> filteredCharacters = [];

  int get lengthCharcters => filteredCharacters.length;
  bool get searchBarNotActive => _name.isEmpty;
  bool get isGridActive => _isGrid;
  bool get isLoading => _isLoading;
  bool get isNoData => _isNoData;
  bool get isNoProblemsService => _isProblemsService;
  bool get isStausActive => _status.isNotEmpty;
  set status(String status) {
    _status = status;
  }

  MainPageProvider() {
    _initData();
  }

  Future<bool> _getData({required numberPage}) async {
    //I think try catch should be in domain layer, but i didn't have much time to refactor code
    try {
      final CharactersInfos data = await _service.getCharacters(
          numberPage: numberPage,
          name: _name,
          status: _status,
          species: _species,
          type: _type,
          gender: _gender);

      charactersInfos = data;

      return true;
    } catch (error) {
      if (error is DioException) {
        if (error.response!.statusCode == 404) {
          _isLoading = false;
          _isNoData = true;
          notifyListeners();
          // return null;
        }
        _isProblemsService = true;
        notifyListeners();
        // return null;
      }
    }
    return false;
  }

  _initData() async {
    print("init data");

    final data = await _getData(numberPage: 0);

    if (data) {
      print(charactersInfos.info.pages);
      characters = charactersInfos.characters;
      filteredCharacters.addAll(characters);
      _isLoading = false;
      notifyListeners();
    }
    print("init data end");
  }

  void loadMoreData({required numberPage}) async {
    final data = await _getData(numberPage: numberPage);
    if (data) {
      characters.addAll(charactersInfos.characters);
      filteredCharacters = characters;
      notifyListeners();
    }
  }

  void searchPersonage(String text) async {
    _isNoData = false;
    _isLoading = true;
    _name = text;
    notifyListeners();

    final data = await _getData(numberPage: 0);
    if (data) {
      characters = charactersInfos.characters;
      filteredCharacters = characters;

      _isLoading = false;
      notifyListeners();
    }
  }

  Character getCharacter(index) {
    return filteredCharacters[index];
  }

  void changeViewContent() {
    _isGrid = !_isGrid;
    notifyListeners();
  }
}
