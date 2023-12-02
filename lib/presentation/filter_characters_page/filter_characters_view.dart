import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neobis_flutter_rick_and_morty/core/consts/assets_consts.dart';
import 'package:neobis_flutter_rick_and_morty/core/consts/colors_consts.dart';
import 'package:neobis_flutter_rick_and_morty/core/consts/texts_styles_consts.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/filter_characters_page/provider_filter_charcters_page/filter_page_provider.dart';
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
        final List<Widget> widgets = <Widget>[
          _getAlphabetMenu(),
          _getStatusMenu(provider),
          _getGenderMenu(provider)
        ];
        return Scaffold(
          appBar: AppBar(
            backgroundColor: ColorsConsts.mainBgColor,
            elevation: 0,
            titleTextStyle: TextStylesConsts.appBarWhiteStyle,
            centerTitle: false,
            leading: UnconstrainedBox(
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(provider.params),
                child: SvgPicture.asset(AssetsConsts.backArrowAppBarIcon),
              ),
            ),
            title: const Text("Filters"),
          ),
          body: Padding(
            padding:
                const EdgeInsets.only(top: 30, left: 16, right: 30, bottom: 10),
            child: ListView.separated(
              itemBuilder: (context, index) {
                return widgets[index];
              },
              separatorBuilder: (context, index) => _getSeparator(),
              itemCount: widgets.length,
            ),
          ),
        );
      },
    );
  }

  _getSeparator() {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 30),
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
            children: _chexkBoxStatusItemBuilder(provider.statuses, provider)),
        const SizedBox(
          height: 36,
        ),
      ],
    );
  }

  _getGenderMenu(FilterPageProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Gender".toUpperCase(),
          style: TextStylesConsts.mainGrayStyle,
        ),
        const SizedBox(
          height: 29,
        ),
        Column(
          children: _chexkBoxGenderItemBuilder(provider.genders, provider),
        ),
        const SizedBox(
          height: 36,
        ),
      ],
    );
  }

  List<Widget> _chexkBoxGenderItemBuilder(
      Map<String, bool> items, FilterPageProvider provider) {
    final List<Widget> widgets = [];
    items.forEach(
      (key, value) {
        widgets.add(Row(
          children: [
            Checkbox(
              side: MaterialStateBorderSide.resolveWith((states) =>
                  const BorderSide(
                      width: 1, color: ColorsConsts.checkBoxBorderColor)),
              value: provider.getParamGender(key),
              onChanged: (value) {
                provider.getParamGender(key)
                    ? null
                    : provider.setParamGender(key);
              },
            ),
            GestureDetector(
              onTap: () {
                provider.getParamGender(key)
                    ? null
                    : provider.setParamGender(key);
              },
              child: Text(
                key.isEmpty ? "All" : key,
                style: TextStylesConsts.mainWhiteStyle,
              ),
            )
          ],
        ));
      },
    );
    return widgets;
  }

  List<Widget> _chexkBoxStatusItemBuilder(
      Map<String, bool> items, FilterPageProvider provider) {
    final List<Widget> widgets = [];
    items.forEach(
      (key, value) {
        widgets.add(Row(
          children: [
            Checkbox(
              side: MaterialStateBorderSide.resolveWith((states) =>
                  const BorderSide(
                      width: 1, color: ColorsConsts.checkBoxBorderColor)),
              value: provider.getParamStatus(key),
              onChanged: (value) {
                provider.getParamStatus(key)
                    ? null
                    : provider.setParamStatus(key);
              },
            ),
            GestureDetector(
              onTap: () {
                provider.getParamStatus(key)
                    ? null
                    : provider.setParamStatus(key);
              },
              child: Text(
                key.isEmpty ? "All" : key,
                style: TextStylesConsts.mainWhiteStyle,
              ),
            )
          ],
        ));
      },
    );
    return widgets;
  }
}
