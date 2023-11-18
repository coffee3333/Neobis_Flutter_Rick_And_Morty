import 'package:flutter/material.dart';
import 'package:neobis_flutter_rick_and_morty/domain/providers/main_page_provider.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/main_page/item_view_builder.dart';
import 'package:provider/provider.dart';

class ListViewBuilder extends StatefulWidget {
  const ListViewBuilder({super.key});

  @override
  State<ListViewBuilder> createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainPageProvider>(
      builder: (context, provider, child) {
        return _viewBuilder(provider);
      },
    );
  }

  Widget _viewBuilder(MainPageProvider provider) {
    return provider.isGridActive
        ? _viewGridBuilder(provider)
        : _viewListBuilder(provider);
  }

  _viewGridBuilder(MainPageProvider provider) {
    return Expanded(
      child: SizedBox(
        height: 200,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250,
            childAspectRatio: 2 / 2.3,
            crossAxisSpacing: 1,
            mainAxisSpacing: 10,
          ),
          itemCount: provider.lengthPersonages,
          itemBuilder: (context, index) {
            return ItemViewBuilder(
              personage: provider.getPersonage(index),
              typeItem: TypeItem.grid,
            );
          },
        ),
      ),
    );
  }

  _viewListBuilder(MainPageProvider provider) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return ItemViewBuilder(
            personage: provider.getPersonage(index),
            typeItem: TypeItem.list,
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 24,
        ),
        itemCount: provider.lengthPersonages,
      ),
    );
  }
}
