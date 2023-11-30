import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neobis_flutter_rick_and_morty/core/consts/assets_consts.dart';
import 'package:neobis_flutter_rick_and_morty/core/consts/colors_consts.dart';
import 'package:neobis_flutter_rick_and_morty/core/consts/texts_styles_consts.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/filter_characters_page/provider_filter_charcters_page/filter_page_provider.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/main_page/provider_main_page/main_page_provider.dart';
import 'package:provider/provider.dart';

class FilterCharactersView extends StatefulWidget {
  const FilterCharactersView({super.key});

  @override
  State<FilterCharactersView> createState() => _FilterCharactersViewState();
}

class _FilterCharactersViewState extends State<FilterCharactersView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FilterPageProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: ColorsConsts.mainBgColor,
            elevation: 0,
            titleTextStyle: TextStylesConsts.appBarWhiteStyle,
            centerTitle: false,
            leading: UnconstrainedBox(
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: SvgPicture.asset(AssetsConsts.backArrowAppBarIcon),
              ),
            ),
            title: const Text("Filters"),
          ),
          body: Padding(
            padding:
                const EdgeInsets.only(top: 30, left: 16, right: 30, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _getAlphabetMenu(),
                _getSeparator(),
                _getStatusMenu(provider),
                _getGenderMenu(),
              ],
            ),
          ),
        );
      },
    );
  }

  _getSeparator() {
    return Container(
      margin: const EdgeInsets.only(top: 36, bottom: 36),
      decoration: BoxDecoration(
        border: Border.all(color: ColorsConsts.separatorColor, width: 2),
      ),
    );
  }

  _getAlphabetMenu() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Sorting".toUpperCase(),
          style: TextStylesConsts.mainGrayStyle,
        ),
        const SizedBox(
          height: 29,
        ),
        Row(
          children: [
            const Text(
              "Alphabet",
              style: TextStylesConsts.mainWhiteStyle,
            ),
            const Spacer(),
            GestureDetector(
              child: SvgPicture.asset(AssetsConsts.sortingSecondFilterIcon),
            ),
            const SizedBox(
              width: 24,
            ),
            GestureDetector(
              child: SvgPicture.asset(AssetsConsts.sortingFilterIcon),
            ),
          ],
        ),
      ],
    );
  }

  _getStatusMenu(FilterPageProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Status".toUpperCase(),
          style: TextStylesConsts.mainGrayStyle,
        ),
        const SizedBox(
          height: 29,
        ),
        Column(
          children: [
            Row(
              children: [
                Checkbox(
                  // activeColor: Colors.white,
                  value: false,
                  onChanged: (value) {},
                ),
                const Text(
                  "Alive",
                  style: TextStylesConsts.nameItemWhiteStyle,
                )
              ],
            )
          ],
        ),
        const SizedBox(
          height: 36,
        ),
      ],
    );
  }

  _getGenderMenu() {
    return const Expanded(child: Placeholder());
  }
}
