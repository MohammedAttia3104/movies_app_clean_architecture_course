import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app_clean_architecture_course/tvs/presentation/controller/tv_bloc/tv_bloc.dart';
import 'package:movies_app_clean_architecture_course/tvs/presentation/pages/tv_screen/widgets/on_air_tvs_component.dart';
import 'package:movies_app_clean_architecture_course/tvs/presentation/pages/tv_screen/widgets/popular_tvs_component.dart';
import 'package:movies_app_clean_architecture_course/tvs/presentation/pages/tv_screen/widgets/top_rated_tvs_component.dart';

class TvScreen extends StatelessWidget {
  const TvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvBloc, TvState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            key: const Key('tvScrollView'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const OnAirTvsComponent(),
                Container(
                  margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0).w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Popular",
                        style: GoogleFonts.poppins(
                          fontSize: 19.0.sp,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          /// TODO : NAVIGATION TO POPULAR SCREEN
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0).w,
                          child: Row(
                            children: [
                              const Text('See More'),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16.0.sp,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const PopularTvsComponent(),
                Container(
                  margin: const EdgeInsets.fromLTRB(
                    16.0,
                    24.0,
                    16.0,
                    8.0,
                  ).w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Top Rated",
                        style: GoogleFonts.poppins(
                          fontSize: 19.0.sp,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          /// TODO : NAVIGATION TO Top Rated Movies Screen
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0).w,
                          child: Row(
                            children: [
                              const Text('See More'),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16.0.sp,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const TopRatedTvsComponent(),
                SizedBox(height: 50.0.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
