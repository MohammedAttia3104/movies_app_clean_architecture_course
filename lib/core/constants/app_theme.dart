import 'package:flutter/material.dart';
import 'package:movies_app_clean_architecture_course/core/constants/app_colors.dart';

ThemeData getAppTheme() {
  return ThemeData(
    // main colors
    scaffoldBackgroundColor: AppColors.kPrimaryBackgroundColor,

    // Bottom nav bar theme
    // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    //   backgroundColor: AppColors.kSecondaryBackgroundColor,
    //   selectedItemColor: AppColors.kPrimaryColor,
    //   unselectedItemColor: AppColors.kPrimaryTextColor,
    //   type: BottomNavigationBarType.fixed,
    // ),

    // app bar theme
    // appBarTheme: AppBarTheme(
    //   backgroundColor: AppColors.kPrimaryBackgroundColor,
    //   elevation: 0,
    //   centerTitle: true,
    //   systemOverlayStyle: SystemUiOverlayStyle.light,
    //   titleTextStyle: Styles.textStyle18Regular,
    // ),
  );
}
