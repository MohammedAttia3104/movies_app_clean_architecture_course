import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app_clean_architecture_course/core/services/services_locator.dart';
import 'package:movies_app_clean_architecture_course/movies/presentation/controllers/movie_details_bloc/movie_details_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/network/api_constance.dart';
import '../../../domain/entities/genres.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int id;

  const MovieDetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieDetailsBloc>(
      create: (context) => sl<MovieDetailsBloc>()
        ..add(GetMovieDetailsEvent(id))
        ..add(GetRecommendationEvent(id)),
      child: const Scaffold(
        body: MovieDetailContent(),
      ),
    );
  }
}

class MovieDetailContent extends StatelessWidget {
  const MovieDetailContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      buildWhen: (previous, current) =>
          previous != current && current is MovieDetailsLoadedState,
      builder: (context, state) {
        if (state is MovieDetailsLoadingState) {
          const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is MovieDetailsLoadedState) {
          return CustomScrollView(
            key: const Key('movieDetailsScrollView'),
            shrinkWrap: true,
            slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 250.0.h,
                  flexibleSpace: FlexibleSpaceBar(
                    background: FadeIn(
                      duration: const Duration(milliseconds: 500),
                      child: ShaderMask(
                        shaderCallback: (rect) {
                          return const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black,
                              Colors.black,
                              Colors.transparent,
                            ],
                            stops: [0.0, 0.5, 1.0, 1.0],
                          ).createShader(
                            Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
                          );
                        },
                        blendMode: BlendMode.dstIn,
                        child: CachedNetworkImage(
                          width: MediaQuery.of(context).size.width,
                          imageUrl: ApiConstance.imageUrl(
                              state.movieDetails.backdropPath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: FadeInUp(
                    from: 20,
                    duration: const Duration(milliseconds: 500),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0).w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(state.movieDetails.title,
                              style: GoogleFonts.poppins(
                                fontSize: 23.0.sp,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.2,
                              )),
                          SizedBox(height: 8.0.h),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 2.0.w,
                                  horizontal: 8.0.h,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey[800],
                                  borderRadius: BorderRadius.circular(4.0).r,
                                ),
                                child: Text(
                                  state.movieDetails.releaseDate.split('-')[0],
                                  style: TextStyle(
                                    fontSize: 16.0.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(width: 16.0.w),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 20.0.sp,
                                  ),
                                  SizedBox(width: 4.0.w),
                                  Text(
                                    (state.movieDetails.voteAverage / 2)
                                        .toStringAsFixed(1),
                                    style: TextStyle(
                                      fontSize: 16.0.sp,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  SizedBox(width: 4.0.w),
                                  Text(
                                    '(${state.movieDetails.voteAverage})',
                                    style: TextStyle(
                                      fontSize: 1.0.sp,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 16.0.w),
                              Text(
                                _showDuration(state.movieDetails.runtime),
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16.0.sp,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.0.h),
                          Text(
                            state.movieDetails.overview,
                            style: TextStyle(
                              fontSize: 14.0.sp,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.2,
                            ),
                          ),
                          SizedBox(height: 8.0.h),
                          Text(
                            'Genres: ${_showGenres(state.movieDetails.genres)}',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12.0.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0).w,
                  sliver: SliverToBoxAdapter(
                    child: FadeInUp(
                      from: 20,
                      duration: const Duration(milliseconds: 500),
                      child: Text(
                        'More like this'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
                // SliverPadding(
                //     padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0).w,
                //     sliver: _showMoviesRecommendations(),
                // ),
            ],
          );
        }
        if (state is MovieDetailsErrorState) {
          return Text(state.message);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  String _showGenres(List<Genres> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }

  Widget _showMoviesRecommendations() {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      buildWhen: (previous, current) =>
          previous != current && current is RecommendationLoadedState,
      builder: (context, state) {
        if (state is RecommendationLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is RecommendationErrorState) {
          return Text(state.message);
        }
        if (state is RecommendationLoadedState) {
          return SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final movieRecommendation = state.recommendation[index];
                return FadeInUp(
                  from: 20,
                  duration: const Duration(milliseconds: 500),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.all(const Radius.circular(4.0).r),
                    child: CachedNetworkImage(
                      imageUrl:
                          ApiConstance.imageUrl(movieRecommendation.backdropPath),
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
                      height: 180.0.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              childCount: state.recommendation.length,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 8.0.h,
              crossAxisSpacing: 8.0.w,
              childAspectRatio: 0.7,
              crossAxisCount: 3,
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
