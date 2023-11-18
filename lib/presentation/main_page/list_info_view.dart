import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neobis_flutter_rick_and_morty/core/consts/assets_consts.dart';
import 'package:neobis_flutter_rick_and_morty/core/consts/texts_styles_consts.dart';
import 'package:neobis_flutter_rick_and_morty/domain/providers/main_page_provider.dart';
import 'package:provider/provider.dart';

class ListInfoView extends StatefulWidget {
  const ListInfoView({super.key});

  @override
  State<ListInfoView> createState() => _ListInfoViewState();
}

class _ListInfoViewState extends State<ListInfoView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainPageProvider>(
      builder: (context, provider, child) {
        return Container(
            margin: const EdgeInsets.only(bottom: 30),
            child: provider.searchBarNotActive
                ? _infoQantity(provider)
                : _infoSearch());
      },
    );
  }

  _infoQantity(MainPageProvider provider) {
    return Row(
      children: [
        Text(
          "Всего персонажей: ".toUpperCase(),
          style: TextStylesConsts.mainGrayStyle,
        ),
        Text(
          provider.lengthPersonages.toString(),
          style: TextStylesConsts.mainGrayStyle,
        ),
        const Spacer(),
        _changeViewContent(provider)
      ],
    );
  }

  _infoSearch() {
    return Container(
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        "Результат поиска".toUpperCase(),
        style: TextStylesConsts.mainGrayStyle,
      ),
    );
  }

  _changeViewContent(MainPageProvider provider) {
    return provider.isGridActive
        ? GestureDetector(
            onTap: () {
              provider.changeViewContentToGrid();
            },
            child: SvgPicture.asset(AssetsConsts.listListInfoIcon),
          )
        : GestureDetector(
            onTap: () {
              provider.changeViewContentToList();
            },
            child: SvgPicture.asset(AssetsConsts.gridListInfoIcon),
          );
  }
}
