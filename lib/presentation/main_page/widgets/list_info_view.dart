import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neobis_flutter_rick_and_morty/core/consts/assets_consts.dart';
import 'package:neobis_flutter_rick_and_morty/core/consts/texts_styles_consts.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/main_page/provider_main_page/main_page_provider.dart';
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
        return provider.isNoProblemsService
            ? Container()
            : Container(
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
          "Всего персонажей: ${provider.isLoading ? "" : provider.charactersInfos.info.quantity}"
              .toUpperCase(),
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
    return GestureDetector(
      onTap: () {
        provider.changeViewContent();
      },
      child: SvgPicture.asset(provider.isGridActive
          ? AssetsConsts.listListInfoIcon
          : AssetsConsts.gridListInfoIcon),
    );
  }
}
