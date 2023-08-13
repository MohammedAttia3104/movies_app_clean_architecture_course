import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app_clean_architecture_course/core/error/failure.dart';
import 'package:movies_app_clean_architecture_course/core/usecase/base_usecase.dart';
import 'package:movies_app_clean_architecture_course/tvs/domain/entities/tv_details.dart';
import 'package:movies_app_clean_architecture_course/tvs/domain/repositories/base_tv_repository.dart';

class GetTvDetailsUseCase extends BaseUseCase<TvDetails, TvDetailsParameters> {
  BaseTvRepository baseTvRepository;

  GetTvDetailsUseCase(this.baseTvRepository);

  @override
  Future<Either<Failure, TvDetails>> call(TvDetailsParameters parameters) async {
    return await baseTvRepository.getTvDetails(parameters);
  }
}

class TvDetailsParameters extends Equatable {
  final int tvId;

  const TvDetailsParameters({required this.tvId});

  @override
  List<Object> get props => [tvId];
}
