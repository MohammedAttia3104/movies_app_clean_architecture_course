import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app_clean_architecture_course/core/constants/app_colors.dart';
import 'package:movies_app_clean_architecture_course/core/constants/app_strings.dart';
import 'package:movies_app_clean_architecture_course/movies/presentation/screens/movies_screen/movies_screen.dart';
import 'package:movies_app_clean_architecture_course/search/presentation/pages/search_screen.dart';
import 'package:movies_app_clean_architecture_course/tvs/presentation/pages/tv_screen/tv_screen.dart';

class LayOutScreen extends StatefulWidget {
  const LayOutScreen({super.key});

  @override
  State<LayOutScreen> createState() => _LayOutScreenState();
}

class _LayOutScreenState extends State<LayOutScreen> {
  int selectedIndex = 0;
  List<Widget> bottomNavBarScreens = [
    const MovieScreen(),
    const TvScreen(),
    const SearchScreen(title: ''),
  ];

  List<String> bottomNavBarIconTitle = [
    AppStrings.movie,
    AppStrings.tv,
    AppStrings.search,
  ];

  List<IconData> bottomNavBarIcon = [
    Icons.movie_creation_rounded,
    Icons.tv_rounded,
    Icons.search_rounded,
  ];

  void pageTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomNavBarScreens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: AppColors.kSecondaryBackgroundColor,
        selectedItemColor: AppColors.kPrimaryColor,
        unselectedItemColor: AppColors.kPrimaryTextColor,
        type: BottomNavigationBarType.fixed,
        onTap: pageTapped,
        currentIndex: selectedIndex,
        items: List.generate(
          bottomNavBarScreens.length,
          (index) => BottomNavigationBarItem(
            icon: Icon(
              bottomNavBarIcon[index],
              size: 20.0.sp,
            ),
            label: bottomNavBarIconTitle[index],
          ),
        ),
      ),
    );
  }
}
