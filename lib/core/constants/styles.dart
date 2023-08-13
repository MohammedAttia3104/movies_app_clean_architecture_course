// ignore_for_file: implementation_imports

import 'dart:ui';
import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app_clean_architecture_course/core/constants/app_colors.dart';
import 'package:movies_app_clean_architecture_course/core/constants/size_config.dart';

abstract class Styles {
  static TextStyle textStyle12Regular = getTextStyle(
    fontSize: TextSize.text12,
    color: AppColors.kPrimaryTextColor,
    fontWeight: FontWeightController.regular,
  );
  static TextStyle textStyle14Regular = getTextStyle(
    fontSize: TextSize.text14,
    color: AppColors.kPrimaryTextColor,
    fontWeight: FontWeightController.regular,
  );
  static TextStyle textStyle14RegularWhite = getTextStyle(
    fontSize: TextSize.text14,
    color: AppColors.kSecondaryTextColor,
    fontWeight: FontWeightController.regular,
  );
  static TextStyle textStyle18Regular = getTextStyle(
    fontSize: TextSize.text18,
    color: AppColors.kSecondaryTextColor,
    fontWeight: FontWeightController.regular,
  );
  static TextStyle textStyle20Regular = getTextStyle(
    fontSize: TextSize.text20,
    color: AppColors.kSecondaryTextColor,
    fontWeight: FontWeightController.regular,
  );
}

abstract class FontWeightController {
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight meduim = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
}

TextStyle getTextStyle({
  required double fontSize,
  FontWeight fontWeight = FontWeight.w600,
  required Color color,
}) {
  return GoogleFonts.poppins(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}
