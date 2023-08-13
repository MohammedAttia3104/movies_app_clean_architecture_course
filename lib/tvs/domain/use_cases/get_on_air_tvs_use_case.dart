import 'package:dartz/dartz.dart';
import 'package:movies_app_clean_architecture_course/core/error/failure.dart';
import 'package:movies_app_clean_architecture_course/core/usecase/base_usecase.dart';
import 'package:movies_app_clean_architecture_course/tvs/domain/entities/tv.dart';
import 'package:movies_app_clean_architecture_course/tvs/domain/repositories/base_tv_repository.dart';

class GetOnAirTvsUseCase extends BaseUseCase<List<Tv>, NoParameters> {
  BaseTvRepository baseTvRepository;

  GetOnAirTvsUseCase(this.baseTvRepository);

  @override
  Future<Either<Failure, List<Tv>>> call(NoParameters parameters) async {
    return await baseTvRepository.getOnAirTvs();
  }
}
