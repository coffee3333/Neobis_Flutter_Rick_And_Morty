import 'package:flutter/material.dart';
import 'package:neobis_flutter_rick_and_morty/core/consts/routes_consts.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        RoutesConsts.home: (context) => const Placeholder(),
      },
      initialRoute: RoutesConsts.home,
    );
  }
}
