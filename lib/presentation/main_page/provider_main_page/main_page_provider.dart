import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:neobis_flutter_rick_and_morty/data/repository/service_data_repository.dart';
import 'package:neobis_flutter_rick_and_morty/dependencies/container/di_container.dart';
import 'package:neobis_flutter_rick_and_morty/domain/models/character_models/character.dart';
import 'package:neobis_flutter_rick_and_morty/domain/models/characters_infos.dart';
import 'package:neobis_flutter_rick_and_morty/domain/repository/service_repository.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/models/characters_params.dart';

class MainPageProvider extends ChangeNotifier {
  final ServiceRepository _service = getIt.get<ServiceDataRepository>();
  CharactersParams _chractersParam = getIt.get<CharactersParams>();
  late CharactersInfos charactersInfos;

  bool _isGrid = false;
  bool _isLoading = true;
  bool _isNoData = false;
  bool _isProblemsService = false;

  late List<Character> characters;
  late List<Character> filteredCharacters = [];

  int get lengthCharcters => filteredCharacters.length;
  bool get searchBarNotActive => _chractersParam.name.isEmpty;
  bool get isGridActive => _isGrid;
  bool get isLoading => _isLoading;
  bool get isNoData => _isNoData;
  bool get isNoProblemsService => _isProblemsService;

  CharactersParams get filterParams => _chractersParam;

  updateFilterParams(Object params) async {
    _chractersParam = params as CharactersParams;
    _isNoData = false;
    _isLoading = true;
    notifyListeners();

    if (await _getData()) {
      characters = charactersInfos.characters;
      filteredCharacters = characters;

      _isLoading = false;
      notifyListeners();
    }
  }

  MainPageProvider() {
    _initData();
  }

  Future<bool> _getData() async {
    //I think try catch should be in domain layer, but i didn't have much time to refactor code
    try {
      final CharactersInfos data = await _service.getCharacters(
          numberPage: _chractersParam.numberPage,
          name: _chractersParam.name,
          status: _chractersParam.status,
          species: _chractersParam.species,
          type: _chractersParam.type,
          gender: _chractersParam.gender);

      charactersInfos = data;

      return true;
    } on DioException catch (exception) {
      print("error");

      if (exception.response!.statusCode == 404) {
        print("404");
        _isLoading = false;
        _isNoData = true;
        notifyListeners();
        return false;
      }
      print("another");
      _isProblemsService = true;
      notifyListeners();

      print("tyt");
    }
    return false;
  }

  _initData() async {
    if (await _getData()) {
      characters = charactersInfos.characters;
      filteredCharacters.addAll(characters);
      _isLoading = false;
      notifyListeners();
    }
  }

  void loadMoreData({required numberPage}) async {
    _chractersParam.numberPage = numberPage;
    if (await _getData()) {
      characters.addAll(charactersInfos.characters);
      filteredCharacters = characters;
      notifyListeners();
    }
  }

  void searchPersonage(String text) async {
    _isNoData = false;
    _isLoading = true;
    _chractersParam.numberPage = 0;
    _chractersParam.name = text;
    notifyListeners();

    if (await _getData()) {
      characters = charactersInfos.characters;
      filteredCharacters = characters;

      _isProblemsService = false;
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
