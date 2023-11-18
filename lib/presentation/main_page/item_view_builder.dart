import 'package:flutter/material.dart';
import 'package:neobis_flutter_rick_and_morty/core/consts/texts_styles_consts.dart';
import 'package:neobis_flutter_rick_and_morty/domain/personage/personage.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/detail_personage_page/detail_page.dart';

enum TypeItem {
  list,
  grid,
}

class ItemViewBuilder extends StatelessWidget {
  final TypeItem typeItem;
  final Personage personage;
  const ItemViewBuilder(
      {super.key, required this.personage, required this.typeItem});

  @override
  Widget build(BuildContext context) {
    Widget item = Container();
    switch (typeItem) {
      case TypeItem.list:
        item = _listItemBuilder(context);
        break;
      case TypeItem.grid:
        item = _gridItemBuilder();
        break;
    }
    return item;
  }

  Widget _listItemBuilder(context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPersonagePage(
              personage: personage,
            ),
          ),
        );
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              personage.fotoUrl,
              width: 74,
              height: 74,
            ),
          ),
          const SizedBox(
            width: 18,
          ),
          _getInfoPerson(CrossAxisAlignment.start)
        ],
      ),
    );
  }

  Widget _gridItemBuilder() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            personage.fotoUrl,
            width: 120,
            height: 122,
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        _getInfoPerson(CrossAxisAlignment.center)
      ],
    );
  }

  Column _getInfoPerson(CrossAxisAlignment aligment) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: aligment,
      children: [
        personage.isAlive
            ? Text(
                "Живой".toUpperCase(),
                style: TextStylesConsts.aliveGreenStyle,
              )
            : Text(
                "Мертвый".toUpperCase(),
                style: TextStylesConsts.notAliveGreenStyle,
              ),
        Text(
          personage.name,
          style: TextStylesConsts.nameItemWhiteStyle,
        ),
        Text(
          "${personage.race}, ${personage.sex}",
          style: TextStylesConsts.mainGrayStyle,
        )
      ],
    );
  }
}
