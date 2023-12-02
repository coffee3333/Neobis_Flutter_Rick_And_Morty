import 'package:flutter/material.dart';
import 'package:neobis_flutter_rick_and_morty/core/consts/texts_styles_consts.dart';
import 'package:neobis_flutter_rick_and_morty/domain/models/character_models/character.dart';

enum TypeItem {
  list,
  grid,
}

class ItemViewBuilder extends StatelessWidget {
  final TypeItem typeItem;
  final Character character;
  const ItemViewBuilder(
      {super.key, required this.character, required this.typeItem});

  @override
  Widget build(BuildContext context) {
    Widget item = Container();
    switch (typeItem) {
      case TypeItem.list:
        item = _listItemBuilder();
        break;
      case TypeItem.grid:
        item = _gridItemBuilder();
        break;
    }
    return item;
  }

  Widget _listItemBuilder() {
    return GestureDetector(
      onTap: () {
        print("detail");
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(
              character.image,
              width: 74.0,
              height: 74.0,
            ),
          ),
          const SizedBox(
            width: 18,
          ),
          _getInfoPerson(CrossAxisAlignment.start, Alignment.centerLeft, false)
        ],
      ),
    );
  }

  Widget _gridItemBuilder() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.network(
            character.image,
            width: 120,
            height: 122,
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        _getInfoPerson(CrossAxisAlignment.center, Alignment.center, true)
      ],
    );
  }

  Column _getInfoPerson(
      CrossAxisAlignment aligmentColumn, Alignment aligmentText, bool grid) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: aligmentColumn,
      children: [
        Text(
          character.status,
          style: TextStylesConsts.aliveGreenStyle,
        ),
        Center(
          child: Container(
            alignment: aligmentText,
            width: 220,
            child: Text(
              character.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              // textAlign: TextAlign.start,
              style: TextStylesConsts.nameItemWhiteStyle,
            ),
          ),
        ),
        grid
            ? Center(
                child: Container(
                  alignment: aligmentText,
                  width: 120,
                  child: Text(
                    "${character.species}, ${character.gender}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    // textAlign: TextAlign.start,
                    style: TextStylesConsts.mainGrayStyle,
                  ),
                ),
              )
            : Text(
                "${character.species}, ${character.gender}",
                style: TextStylesConsts.mainGrayStyle,
              )
      ],
    );
  }
}
