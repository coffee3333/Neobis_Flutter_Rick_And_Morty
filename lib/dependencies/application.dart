import 'package:flutter/material.dart';
import 'package:neobis_flutter_rick_and_morty/core/consts/colors_consts.dart';
import 'package:neobis_flutter_rick_and_morty/core/consts/routes_consts.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/main_page/main_page.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: ColorsConsts.mainBgColor),
      debugShowCheckedModeBanner: false,
      routes: {
        RoutesConsts.home: (context) => const MainPage(),
      },
      initialRoute: RoutesConsts.home,
    );
  }
}
