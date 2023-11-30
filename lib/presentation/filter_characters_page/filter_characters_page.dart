import 'package:flutter/material.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/filter_characters_page/provider_filter_charcters_page/filter_page_provider.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/filter_characters_page/filter_characters_view.dart';
import 'package:provider/provider.dart';

class FilterCharactersPage extends StatelessWidget {
  const FilterCharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FilterPageProvider(),
      child: const FilterCharactersView(),
    );
  }
}
