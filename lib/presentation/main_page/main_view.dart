import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neobis_flutter_rick_and_morty/core/consts/assets_consts.dart';
import 'package:neobis_flutter_rick_and_morty/core/consts/colors_consts.dart';
import 'package:neobis_flutter_rick_and_morty/core/consts/texts_styles_consts.dart';
import 'package:neobis_flutter_rick_and_morty/domain/providers/main_page_provider.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/main_page/list_builder_view.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/main_page/list_info_view.dart';
import 'package:provider/provider.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConsts.mainBgColor,
      appBar: _getAppBar(),
      body: const Padding(
        padding: EdgeInsets.only(top: 30, left: 16, right: 30),
        child: Column(
          children: [
            ListInfoView(),
            ListViewBuilder(),
          ],
        ),
      ),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      backgroundColor: ColorsConsts.mainBgColor,
      elevation: 0,
      title: TextField(
        controller: _searchController,
        style: TextStylesConsts.mainWhiteStyle,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorsConsts.searchBgColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          prefixIcon: Container(
            padding: const EdgeInsets.only(right: 10, left: 15),
            child: UnconstrainedBox(
              child: SvgPicture.asset(AssetsConsts.appBarSearchIcon),
            ),
          ),
          suffixIcon: Container(
            padding: const EdgeInsets.only(right: 15, left: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                UnconstrainedBox(
                  child:
                      SvgPicture.asset(AssetsConsts.appBarSearchSeparatorIcon),
                ),
                const SizedBox(width: 12),
                UnconstrainedBox(
                  child: SvgPicture.asset(AssetsConsts.appBarSortIcon),
                ),
              ],
            ),
          ),
          hintText: 'Найти персонажа',
          hintStyle: TextStylesConsts.mainGrayStyle,
        ),
        onChanged: (value) {
          Provider.of<MainPageProvider>(context, listen: false)
              .changeSearchPersonage(value);
        },
      ),
    );
  }
}
