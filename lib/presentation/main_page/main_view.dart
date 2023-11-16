import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neobis_flutter_rick_and_morty/core/consts/assets_consts.dart';
import 'package:neobis_flutter_rick_and_morty/core/consts/colors_consts.dart';
import 'package:neobis_flutter_rick_and_morty/domain/providers/main_page_provider.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/main_page/list_builder_view.dart';
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
      body: const Column(
        children: [
          ListViewBuilder(),
        ],
      ),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      backgroundColor: ColorsConsts.mainBgColor,
      title: TextField(
        controller: _searchController,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
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
          hintStyle: const TextStyle(
            color: ColorsConsts.searchTextColor,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        onChanged: (value) {
          Provider.of<MainPageProvider>(context, listen: false)
              .changeSearchPersonage(value);
        },
      ),
    );
  }
}
