import 'package:flutter/material.dart';
import 'package:neobis_flutter_rick_and_morty/dependencies/application.dart';
import 'package:neobis_flutter_rick_and_morty/dependencies/container/di_container.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupDi();
  runApp(const Application());
}
