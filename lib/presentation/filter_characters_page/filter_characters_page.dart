import 'package:flutter/material.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/filter_characters_page/provider_filter_charcters_page/filter_page_provider.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/filter_characters_page/filter_characters_view.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/models/characters_params.dart';
import 'package:provider/provider.dart';

class FilterCharactersPage extends StatelessWidget {
  const FilterCharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)?.settings.arguments as CharactersParams?;

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: ChangeNotifierProvider(
        create: (context) => FilterPageProvider(params: data),
        child: const FilterCharactersView(),
      ),
    );
  }
}
