import 'package:get_it/get_it.dart';
import 'package:movies_app_clean_architecture_course/lay_out/presentation/controllers/bottom_nav_bar_bloc.dart';
import 'package:movies_app_clean_architecture_course/movies/data/data_sources/movie_remote_data_source.dart';
import 'package:movies_app_clean_architecture_course/movies/data/repositories/movies_repository.dart';
import 'package:movies_app_clean_architecture_course/movies/domain/repositories/base_movies_repository.dart';
import 'package:movies_app_clean_architecture_course/movies/domain/usecases/get_movie_details_use_case.dart';
import 'package:movies_app_clean_architecture_course/movies/domain/usecases/get_now_playing_movies_use_case.dart';
import 'package:movies_app_clean_architecture_course/movies/domain/usecases/get_popular_movies_use_case.dart';
import 'package:movies_app_clean_architecture_course/movies/domain/usecases/get_recommendation_use_case.dart';
import 'package:movies_app_clean_architecture_course/movies/domain/usecases/get_top_rated_movies_use_case.dart';
import 'package:movies_app_clean_architecture_course/movies/presentation/controllers/movie_details_bloc/movie_details_bloc.dart';
import 'package:movies_app_clean_architecture_course/movies/presentation/controllers/movies_bloc/movies_bloc.dart';
import 'package:movies_app_clean_architecture_course/search/data/data_sources/remote_search_data_source.dart';
import 'package:movies_app_clean_architecture_course/search/data/repositories/search_repository.dart';
import 'package:movies_app_clean_architecture_course/search/domain/repositories/base_search_repository.dart';
import 'package:movies_app_clean_architecture_course/search/domain/use_cases/get_search_result_use_case.dart';
import 'package:movies_app_clean_architecture_course/search/presentation/controllers/search_bloc.dart';
import 'package:movies_app_clean_architecture_course/tvs/data/data_sources/tvs_remote_data_source.dart';
import 'package:movies_app_clean_architecture_course/tvs/data/repositories/tvs_repository.dart';
import 'package:movies_app_clean_architecture_course/tvs/domain/repositories/base_tv_repository.dart';
import 'package:movies_app_clean_architecture_course/tvs/domain/use_cases/get_on_air_tvs_use_case.dart';
import 'package:movies_app_clean_architecture_course/tvs/domain/use_cases/get_popular_tvs_use_case.dart';
import 'package:movies_app_clean_architecture_course/tvs/domain/use_cases/get_tv_recommendation_use_case.dart';
import 'package:movies_app_clean_architecture_course/tvs/domain/use_cases/get_top_rated_tvs_use_case.dart';
import 'package:movies_app_clean_architecture_course/tvs/domain/use_cases/get_tv_details_use_case.dart';
import 'package:movies_app_clean_architecture_course/tvs/presentation/controller/tv_bloc/tv_bloc.dart';
import 'package:movies_app_clean_architecture_course/tvs/presentation/controller/tv_details_bloc/tv_details_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ///Movie Module
    //Movies Bloc
    sl.registerFactory<MoviesBloc>(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory<MovieDetailsBloc>(() => MovieDetailsBloc(sl(), sl()));

    //Movies UseCase
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));

    //Movies Repository
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sl()));

    //Movies Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());

    ///Tv Module
    //Tvs Bloc
    sl.registerFactory<TvBloc>(() => TvBloc(sl(), sl(), sl()));
    sl.registerFactory<TvDetailsBloc>(() => TvDetailsBloc(sl(), sl()));

    //Tvs UseCase
    sl.registerLazySingleton(() => GetOnAirTvsUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularTvsUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedTvsUseCase(sl()));
    sl.registerLazySingleton(() => GetTvDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetTvRecommendationUseCase(sl()));

    //Tvs Repository
    sl.registerLazySingleton<BaseTvRepository>(() => TvsRepository(sl()));

    //Tvs Data Source
    sl.registerLazySingleton<BaseTvsRemoteDataSource>(
        () => TvsRemoteDataSource());

    ///Search Module
    //Search Bloc
    sl.registerFactory<SearchBloc>(() => SearchBloc(sl()));

    //Seach UseCase
    sl.registerLazySingleton(() => GetSearchResultUseCase(sl()));

    //Search Repository
    sl.registerLazySingleton<BaseSearchRepository>(
        () => SearchRepository(sl()));

    //Search Data Source
    sl.registerLazySingleton<BaseRemoteSearchDataSource>(
        () => RemoteSearchDataSource());

    //Bottom Nav Bar Bloc
    sl.registerFactory<BottomNavBarBloc>(() => BottomNavBarBloc());
  }
}
