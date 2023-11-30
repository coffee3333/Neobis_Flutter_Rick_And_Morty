import 'package:flutter/material.dart';
import 'package:neobis_flutter_rick_and_morty/dependencies/container/di_container.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/main_page/provider_main_page/main_page_provider.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/main_page/main_view.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => getIt.get<MainPageProvider>(),
      child: const MainView(),
    );
  }
}
