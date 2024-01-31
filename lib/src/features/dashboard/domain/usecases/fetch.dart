
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../data/repositories/dashboard_repository.dart';
import '../entities/dashboard_model.dart';

class FetchDashboard implements UseCase<DashboardModel, NoParams> {
  FetchDashboard(this.repository);

  final DashboardRepository repository;

  @override
  Future<Either<Failure, DashboardModel>> call(NoParams params) => repository.fetch();
}