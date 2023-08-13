import 'package:flutter/material.dart';
import 'package:movies_app_clean_architecture_course/core/constants/size_config.dart';
import 'package:movies_app_clean_architecture_course/core/constants/styles.dart';
import 'package:movies_app_clean_architecture_course/core/network/api_constance.dart';
import 'package:movies_app_clean_architecture_course/core/widgets/image_with_shimmer.dart';
import 'package:movies_app_clean_architecture_course/movies/presentation/screens/movie_details_screen/movie_detail_screen.dart';
import 'package:movies_app_clean_architecture_course/search/domain/entities/search_item.dart';
import 'package:movies_app_clean_architecture_course/tvs/presentation/pages/tv_details_screen/tv_details_screen.dart';

class GridSingleComponent extends StatelessWidget {
  final SearchItem item;

  const GridSingleComponent({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          ///Error Could Occur Here
          onTap: () {
            item.isMovie
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          MovieDetailsScreen(id: item.id),
                    ),
                  )
                : Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          TvDetailsScreen(tvId: item.id),
                    ),
                  );
          },
          child: AspectRatio(
            aspectRatio: 2 / 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(CustomSize.circular8),
              child: ImageWithShimmer(
                imageUrl: ApiConstance.posterUrl(item.posterPath),
                width: double.infinity,
                height: PaddingSize.padding150h,
              ),
            ),
          ),
        ),
        Expanded(
          child: Text(
            item.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Styles.textStyle14RegularWhite,
          ),
        ),
      ],
    );
  }
}
