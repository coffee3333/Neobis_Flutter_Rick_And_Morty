import 'package:flutter/foundation.dart';

import 'package:neobis_flutter_rick_and_morty/presentation/models/characters_params.dart';

class FilterPageProvider extends ChangeNotifier {
  final CharactersParams? params;
  FilterPageProvider({
    this.params,
  }) {
    _detectorParams(params);
  }

  // final Map<String, bool> _selectedSorting = {
  // };

  final Map<String, bool> _selectedGender = {
    "": false,
    "Female": false,
    "Male": false,
    "Genderless": false,
    "Unknown": false,
  };

  final Map<String, bool> _selectedStatus = {
    "": false,
    "Alive": false,
    "Dead": false,
    "Unknown": false,
  };

  Map<String, bool> get statuses => _selectedStatus;
  Map<String, bool> get genders => _selectedGender;

  bool get paramsData => params != null;

  bool getParamStatus(String status) {
    return _selectedStatus[status] ?? false;
  }

  setParamStatus(String status) {
    _paramsFalse(_selectedStatus);
    _selectedStatus[status] = true;
    params?.status = status;
    notifyListeners();
  }

  bool getParamGender(String gender) {
    return _selectedGender[gender] ?? false;
  }

  setParamGender(String gender) {
    _paramsFalse(_selectedGender);
    _selectedGender[gender] = true;
    params?.gender = gender;
    notifyListeners();
  }

  _paramsFalse(Map<String, bool> params) {
    params.forEach((key, value) {
      params[key] = false;
    });
  }

  _detectorParams(CharactersParams? params) {
    if (params != null) {
      params.numberPage = 0;
      _paramsFalse(_selectedGender);
      _paramsFalse(_selectedStatus);
      _selectedGender[params.gender] = true;
      _selectedStatus[params.status] = true;
      notifyListeners();
    }
  }

  void selectorStatus(String value) {
    params?.status = value;
  }

  void selectorGender(String value) {
    params?.gender = value;
  }
}
