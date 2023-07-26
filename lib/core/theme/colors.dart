import 'package:flutter/material.dart';

const kBlueColor = Color.fromRGBO(0, 86, 241, 1);
const kGreyCOlor = Color.fromRGBO(53, 73, 97, 1);
const kDarkCOlor = Color.fromRGBO(31, 31, 31, 1);
const kLightGreyColor = Color.fromRGBO(245, 246, 247, 1);
const kGreenColor = Color.fromRGBO(93, 169, 84, 1);
const kRedColor = Color.fromRGBO(232, 68, 56, 1);
const kDarkRedColor = Color.fromRGBO(174, 49, 40, 1);
const kWhiteColor = Colors.white;
const vetsGreen = Color.fromRGBO(112, 154, 64, 1);
const kScaffoldBackgroundCOlor = Color.fromRGBO(245, 246, 247, 1);
const kPurpleColor = Color.fromRGBO(116, 81, 216, 1);
const kLightGreen = Color.fromRGBO(235, 247, 238, 1);
const kLightRedColor = Color.fromRGBO(251, 237, 235, 1);
const kLightPurpleColor = Color.fromRGBO(241, 237, 251, 1);
const kLightBlueColor = Color.fromRGBO(230, 239, 254, 1);
const kLightWhite = Color.fromRGBO(245, 246, 247, 1);

////////////////////////////////////////////////////////////////:
class AppColors {
  static const Map<int, Color> _primaryColor = {
    50: Color.fromRGBO(20, 86, 241, .1),
    100: Color.fromRGBO(0, 86, 241, .2),
    200: Color.fromRGBO(0, 86, 241, .3),
    300: Color.fromRGBO(0, 86, 241, .4),
    400: Color.fromRGBO(0, 86, 241, .5),
    500: Color.fromRGBO(0, 86, 241, .6),
    600: Color.fromRGBO(0, 86, 241, .7),
    700: Color.fromRGBO(0, 86, 241, .8),
    800: Color.fromRGBO(0, 86, 241, .9),
    900: Color.fromRGBO(0, 86, 241, 1),
  };

  static MaterialColor mainColorSwatch =
      MaterialColor(primaryColor.value, _primaryColor);

  static const textFieldFillColor = Color(0xffF5F5F7);

  // main colors
  static const primaryColor = Color.fromRGBO(0, 86, 241, 1);
  static const primarySuperLightColor = Color(0xffF2F8FC);
  static const primaryColorDisable = Color(0xff076FCA);
  static const primaryLightColor = Color(0xffE5F6FF);
  static const primaryDisabledColor = Color(0xff809AA8);
  static const blue30Color = Color(0xffECF0F3);
  static const secondaryColor = Color(0xffF3AB2A);
  static const secondaryLightColor = Color(0xf7ffd891);
  static const negativeColor = Color(0xffF44336);
  static const negative0_05Color = Color(0x0df44336);
  static const white = Color(0xffffffff);
  static const blue3 = Color(0xff64C1F7);

  static const paymentCardColo = Color(0xff303030);
  // greys
  static const grey1 = Color(0xffFBFBFB);
  static const grey1_5 = Color(0xffF7F7F7);
  static const grey2 = Color(0xffF4F4F4);
  static const gery6 = Color(0xffEFEFEF);
  static const grey10 = Color(0xffF5F5F7);
  static const grey20 = Color(0xffCCCCCC);
  static const grey30 = Color(0xffB3B3B3);
  static const grey40 = Color(0xff999999);
  static const grey50 = Color(0xff808080);
  static const grey60 = Color(0xff666666);
  static const grey70 = Color(0xff4D4D4D);
  static const grey80 = Color(0xff333333);
  static const grey90 = Color(0xff1A1A1A);

  static const disabledButton = Color(0xffDDDDDD);
  static const moreLessTitleColor = Color(0xffA9A9BA);
  static const moreLessSubTitleColor = Color(0xff1D1D1D);

  // text colors
  static const appBarTextDarkColor = kDarkCOlor;
  static const appBarTextWHiteColor = kWhiteColor;
  static const senderMessageTextColor = kWhiteColor;
  static const recieverMessageTextColor = kDarkCOlor;
  static const largeTextColor = kGreyCOlor;
  static const primaryButtonTextColor = kWhiteColor;
  static const primaryButtonDarkColor = kDarkCOlor;
  static const meduimTextColor = kWhiteColor;
  static const baseTextColor = kDarkCOlor;
}
