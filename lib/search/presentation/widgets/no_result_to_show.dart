import 'package:flutter/cupertino.dart';
import 'package:movies_app_clean_architecture_course/core/constants/app_strings.dart';
import 'package:movies_app_clean_architecture_course/core/constants/styles.dart';

class NoResultToShow extends StatelessWidget {
  const NoResultToShow({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppStrings.noResultsToShow,
        style: Styles.textStyle14RegularWhite,
      ),
    );
  }
}
