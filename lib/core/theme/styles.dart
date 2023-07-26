import 'package:flutter/material.dart';

import 'package:vets_project/core/theme/colors.dart';
import 'package:vets_project/core/theme/doubles.dart';

extension TextStyles on String {
  static const sloganTextStyle = TextStyle(
    fontSize: extraLargeTextSize,
    color: kWhiteColor,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.none,
  );

  static const largeTextStyle = TextStyle(
    fontSize: largeTextSize,
    color: AppColors.largeTextColor,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.none,
  );
  static const largeWhiteTextStyle = TextStyle(
    fontSize: 20,
    color: kWhiteColor,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none,
  );

  static const meduimTextSTyle = TextStyle(
    fontSize: meduimTextSize,
    color: AppColors.meduimTextColor,
    fontWeight: FontWeight.w300,
    decoration: TextDecoration.none,
  );

  static const baseTextStyle = TextStyle(
    fontSize: baseTextSize,
    color: AppColors.baseTextColor,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none,
  );
  static const smallTextStyle = TextStyle(
    fontSize: smallTextSize,
    color: AppColors.baseTextColor,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none,
  );

  static const primaryButtonTextSTyle = TextStyle(
    fontSize: baseTextSize,
    color: kWhiteColor,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none,
  );
  static const primaryButtonDarkTextSTyle = TextStyle(
    fontSize: baseTextSize,
    color: kDarkCOlor,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none,
  );
  static const facebookButton = TextStyle(
    fontSize: baseTextSize,
    color: kWhiteColor,
    fontWeight: FontWeight.w500,
  );
  static const googleButton = TextStyle(
    fontSize: baseTextSize,
    color: kWhiteColor,
    fontWeight: FontWeight.w500,
  );
}
