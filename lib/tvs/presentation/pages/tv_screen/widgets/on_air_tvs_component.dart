import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app_clean_architecture_course/core/network/api_constance.dart';
import 'package:movies_app_clean_architecture_course/tvs/presentation/controller/tv_bloc/tv_bloc.dart';

class OnAirTvsComponent extends StatelessWidget {
  const OnAirTvsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvBloc, TvState>(
      buildWhen: (previous, current) =>
          previous != current && current is OnAirTvLoadedState,
      builder: (context, state) {
        if (state is OnAirTvLoadingState) {
          SizedBox(
            height: 400.0.h,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is OnAirTvLoadedState) {
          return FadeIn(
            duration: const Duration(milliseconds: 500),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 400.0.h,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {},
              ),
              items: state.onAirTvs.map(
                (item) {
                  return GestureDetector(
                    key: const Key('openTvMinimalDetail'),
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) =>
                      //           MovieDetailsScreen(id: item.id),
                      //     ));
                    },
                    child: Stack(
                      children: [
                        ShaderMask(
                          shaderCallback: (rect) {
                            return const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                // fromLTRB
                                Colors.transparent,
                                Colors.black,
                                Colors.black,
                                Colors.transparent,
                              ],
                              stops: [0, 0.3, 0.5, 1],
                            ).createShader(
                              Rect.fromLTRB(0, 0, rect.width, rect.height),
                            );
                          },
                          blendMode: BlendMode.dstIn,
                          child: CachedNetworkImage(
                            height: 560.0.h,
                            imageUrl: ApiConstance.imageUrl(item.backdropPath ?? '/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 16.0.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      color: Colors.redAccent,
                                      size: 16.0.sp,
                                    ),
                                    const SizedBox(width: 4.0),
                                    Text(
                                      'Now Playing'.toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 16.0.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 16.0.h),
                                child: Text(
                                  item.name,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 24.0.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ).toList(),
            ),
          );
        }
        if (state is OnAirTvErrorState) {
          return Text(state.message);
        }
        return SizedBox(
          height: 400.0.h,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
