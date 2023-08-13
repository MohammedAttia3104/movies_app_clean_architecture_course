import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app_clean_architecture_course/core/bloc_observer.dart';
import 'package:movies_app_clean_architecture_course/core/services/services_locator.dart';
import 'package:movies_app_clean_architecture_course/lay_out/presentation/controllers/bottom_nav_bar_bloc.dart';
import 'package:movies_app_clean_architecture_course/lay_out/presentation/pages/lay_out_screen.dart';
import 'package:movies_app_clean_architecture_course/movies/presentation/controllers/movies_bloc/movies_bloc.dart';
import 'package:movies_app_clean_architecture_course/tvs/presentation/controller/tv_bloc/tv_bloc.dart';

void main() {
  ServicesLocator().init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BottomNavBarBloc>(
      create: (_) => sl<BottomNavBarBloc>(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<MoviesBloc>(
                create: (context) => sl<MoviesBloc>()
                  ..add(GetNowPlayingMoviesEvent())
                  ..add(GetPopularMoviesEvent())
                  ..add(GetTopRatedMoviesEvent()),
              ),
              BlocProvider<TvBloc>(
                create: (context) => sl<TvBloc>()
                  ..add(GetOnAirTvsEvent())
                  ..add(GetPopularTvsEvent())
                  ..add(GetTopRatedTvsEvent()),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Movies App',
              theme: ThemeData.dark().copyWith(
                scaffoldBackgroundColor: Colors.grey.shade900,
              ),
              home: const LayOutScreen(),
            ),
          );
        },
      ),
    );
  }
}
