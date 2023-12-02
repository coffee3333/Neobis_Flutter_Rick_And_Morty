import 'package:flutter/material.dart';
import 'package:neobis_flutter_rick_and_morty/core/consts/assets_consts.dart';
import 'package:neobis_flutter_rick_and_morty/core/consts/texts_styles_consts.dart';

import 'package:neobis_flutter_rick_and_morty/presentation/main_page/provider_main_page/main_page_provider.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/main_page/widgets/item_view_builder.dart';
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
        return provider.isNoData
            ? _errorSearchView()
            : provider.isLoading
                ? _loadingView()
                : _notificationViewBuilder(provider);
      },
    );
  }

  NotificationListener<ScrollNotification> _notificationViewBuilder(
      MainPageProvider provider) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
            provider.charactersInfos.info.nextPage != null) {
          // Reached the end of the list, load more data
          provider.loadMoreData(
            numberPage: provider.charactersInfos.info.nextPage,
          );
        }
        return true;
      },
      child: _viewBuilder(provider),
    );
  }

  _errorSearchView() {
    return Container(
      margin: const EdgeInsets.only(top: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetsConsts.noCharactersIcon,
          ),
          const SizedBox(
            height: 28,
          ),
          Container(
            alignment: Alignment.centerLeft,
            width: 220,
            child: const Text(
              "We didn't find character with this name",
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStylesConsts.mainGrayBigerStyle,
            ),
          ),
        ],
      ),
    );
  }

  _viewBuilder(MainPageProvider provider) {
    return provider.isGridActive
        ? _viewGridBuilder(provider)
        : _viewListBuilder(provider);
  }

  _loadingView() {
    return const Expanded(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
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
          itemCount: provider.lengthCharcters,
          itemBuilder: (context, index) {
            return ItemViewBuilder(
              character: provider.getCharacter(index),
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
          if (index == provider.lengthCharcters) {
            if (provider.charactersInfos.info.nextPage != null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Center(
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey, width: 2),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              );
            }
          }
          return ItemViewBuilder(
            character: provider.getCharacter(index),
            typeItem: TypeItem.list,
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 24,
        ),
        itemCount: provider.lengthCharcters + 1,
      ),
    );
  }
}
