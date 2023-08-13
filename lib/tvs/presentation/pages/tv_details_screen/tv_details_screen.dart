
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app_clean_architecture_course/core/network/api_constance.dart';
import 'package:movies_app_clean_architecture_course/core/services/services_locator.dart';
import 'package:movies_app_clean_architecture_course/tvs/domain/entities/tv_genres.dart';
import 'package:movies_app_clean_architecture_course/tvs/presentation/controller/tv_details_bloc/tv_details_bloc.dart';
import 'package:shimmer/shimmer.dart';

class TvDetailsScreen extends StatelessWidget {
  final int tvId;

  const TvDetailsScreen({
    super.key,
    required this.tvId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<TvDetailsBloc>(
        create: (context) => sl<TvDetailsBloc>()
          ..add(GetTvDetailsEvent(id: tvId))
          ..add(GetTvRecommendationEvent(tvId)),
        child: const TvDetailsContent(),
      ),
    );
  }
}

class TvDetailsContent extends StatelessWidget {
  const TvDetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvDetailsBloc, TvDetailsState>(
      buildWhen: (previous, current) =>
          previous != current && current is TvDetailsLoadedState,
      builder: (context, state) {
        if (state is TvDetailsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is TvDetailsLoadedState) {
          return CustomScrollView(
            key: const Key('tvDetailScrollView'),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
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
                          state.tvDetails.backdropPath,
                        ),
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
                        Text(state.tvDetails.name,
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
                                state.tvDetails.firstAirDate.split('-')[0],
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
                                  (state.tvDetails.voteAverage / 2)
                                      .toStringAsFixed(1),
                                  style: TextStyle(
                                    fontSize: 16.0.sp,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                SizedBox(width: 4.0.w),
                                Text(
                                  '(${state.tvDetails.voteAverage})',
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
                              '${state.tvDetails.numberOfSeasons} Seasons',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16.0.sp,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.2,
                              ),
                            ),
                            SizedBox(width: 16.0.w),
                            Text(
                              _showDuration(
                                  state.tvDetails.episodeRunTime as List<int>),
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
                          state.tvDetails.overview,
                          style: TextStyle(
                            fontSize: 14.0.sp,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.2,
                          ),
                        ),
                        SizedBox(height: 8.0.h),
                        Text(
                          'Genres: ${_showGenres(state.tvDetails.genres)}',
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
              //   padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0).w,
              //   sliver: _showTvRecommendations(),
              // ),
            ],
          );
        }
        if (state is TvDetailsErrorState) {
          return Text(state.message);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

String _showGenres(List<TvGenres> genres) {
  String result = '';
  for (var genre in genres) {
    result += '${genre.name}, ';
  }

  if (result.isEmpty) {
    return result;
  }

  return result.substring(0, result.length - 2);
}

String _showDuration(List<int> runtime) {
  for (var element in runtime) {
    final int hours = element ~/ 60;
    final int minutes = element % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }
  return '';
}

Widget _showTvRecommendations() {
  return BlocBuilder<TvDetailsBloc, TvDetailsState>(
    buildWhen: (previous, current) =>
        previous != current && current is TvRecommendaionLoadedState,
    builder: (context, state) {
      if (state is TvRecommendaionLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is TvRecommendaionErrorState) {
        return Text(state.message);
      }
      if (state is TvRecommendaionLoadedState) {
        return SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final tvRecommendation = state.tvRecommendaionList[index];
              return FadeInUp(
                from: 20,
                duration: const Duration(milliseconds: 500),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(const Radius.circular(4.0).r),
                  child: CachedNetworkImage(
                    imageUrl:
                        ApiConstance.imageUrl(tvRecommendation.backdropPath!),
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
            childCount: state.tvRecommendaionList.length,
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
