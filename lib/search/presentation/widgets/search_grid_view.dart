import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app_clean_architecture_course/core/constants/size_config.dart';
import 'package:movies_app_clean_architecture_course/search/domain/entities/search_item.dart';
import 'package:movies_app_clean_architecture_course/search/presentation/widgets/grid_single_component.dart';

class SearchGridView extends StatelessWidget {
  const SearchGridView({super.key, required this.searchResults});

  final List<SearchItem> searchResults;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.symmetric(vertical: PaddingSize.padding12h),
        itemCount: searchResults.length,
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12.0.w,
          childAspectRatio: 0.55,
        ),
        itemBuilder: (context, index) {
          return GridSingleComponent(item: searchResults[index]);
        },
      ),
    );
  }
}
