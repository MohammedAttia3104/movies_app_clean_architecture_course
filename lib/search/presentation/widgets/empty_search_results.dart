import 'package:flutter/material.dart';
import 'package:movies_app_clean_architecture_course/core/constants/app_strings.dart';
import 'package:movies_app_clean_architecture_course/core/constants/size_config.dart';
import 'package:movies_app_clean_architecture_course/core/constants/styles.dart';

class EmptySearchResultsComponent extends StatelessWidget {
  const EmptySearchResultsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppStrings.search,
            style: Styles.textStyle20Regular,
          ),
          SizedBox(
            height: PaddingSize.padding6h,
          ),
          Text(
            AppStrings.noSearchResultContent,
            style: Styles.textStyle14RegularWhite,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
