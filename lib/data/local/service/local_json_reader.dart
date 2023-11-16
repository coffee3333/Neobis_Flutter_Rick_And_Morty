import 'dart:convert';

import 'package:flutter/services.dart';

class GetData {
  Future<List<dynamic>> readJson() async {
    final String response =
        await rootBundle.loadString('assets/jsons/personages.json');
    final data = await json.decode(response);
    return data['personages'];
  }
}
