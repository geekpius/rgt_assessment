
import 'package:dartz/dartz.dart';
import 'package:rgt_assessment/src/features/dashboard/domain/repositories/dashboard_repository.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/usecases/usecase.dart';
import '../entities/dashboard_model.dart';

class FetchDashboard implements UseCase<DashboardModel, NoParams> {
  FetchDashboard(this.repository);

  final DashboardRepository repository;

  @override
  Future<Either<Failure, DashboardModel>> call(NoParams params) => repository.fetch();
}