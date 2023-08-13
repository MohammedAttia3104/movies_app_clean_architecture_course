import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app_clean_architecture_course/core/network/api_constance.dart';
import 'package:movies_app_clean_architecture_course/movies/presentation/controllers/movies_bloc/movies_bloc.dart';
import 'package:movies_app_clean_architecture_course/movies/presentation/screens/movie_details_screen/movie_detail_screen.dart';
import 'package:shimmer/shimmer.dart';


class PopularMoviesComponent extends StatelessWidget {
  const PopularMoviesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) => previous != current && current is PopularMoviesLoadedState,
      builder: (context, state) {
        if (state is PopularMoviesLoadingState) {
          SizedBox(
            height: 170.0.h,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is PopularMoviesLoadedState) {
          return FadeIn(
            duration: const Duration(milliseconds: 500),
            child: SizedBox(
              height: 170.0.h,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0).w,
                itemCount: state.popularMovies.length,
                itemBuilder: (context, index) {
                  final movie = state.popularMovies[index];
                  return Container(
                    padding: const EdgeInsets.only(right: 8.0).w,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const MovieDetailsScreen(id: 614479),));
                      },
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8.0)).r,
                        child: CachedNetworkImage(
                          width: 120.0.w,
                          fit: BoxFit.cover,
                          imageUrl: ApiConstance.imageUrl(movie.backdropPath),
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey[850]!,
                            highlightColor: Colors.grey[800]!,
                            child: Container(
                              height: 170.0.h,
                              width: 120.0.w,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8.0).r,
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }
        if (state is PopularMoviesErrorState) {
          return Text(state.message);
        }
        return SizedBox(
          height: 170.0.h,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
