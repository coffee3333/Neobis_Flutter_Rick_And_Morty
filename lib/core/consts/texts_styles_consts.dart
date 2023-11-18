import 'package:flutter/material.dart';
import 'package:neobis_flutter_rick_and_morty/core/consts/colors_consts.dart';

class TextStylesConsts {
  static const TextStyle mainWhiteStyle = TextStyle(
    fontFamily: 'Roboto',
    color: Colors.white,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: 0.5,
    height: 1.5,
  );

  static const TextStyle nameItemWhiteStyle = TextStyle(
    fontFamily: 'Roboto',
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontSize: 16,
    letterSpacing: 0.5,
    height: 1.5,
  );

  static const TextStyle aliveGreenStyle = TextStyle(
    fontFamily: 'Roboto',
    color: ColorsConsts.aliveTextColor,
    fontWeight: FontWeight.w600,
    fontSize: 12,
    letterSpacing: 0.5,
    height: 1.5,
  );

  static const TextStyle notAliveGreenStyle = TextStyle(
    fontFamily: 'Roboto',
    color: ColorsConsts.notAliveTextColor,
    fontWeight: FontWeight.w600,
    fontSize: 12,
    letterSpacing: 0.5,
    height: 1.5,
  );

  static const TextStyle mainGrayStyle = TextStyle(
    fontFamily: 'Roboto',
    color: ColorsConsts.searchTextColor,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: 0.5,
    height: 1.5,
  );
}
