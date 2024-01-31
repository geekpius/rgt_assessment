
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../data/remote_database/dashboard_remote_database.dart';
import '../entities/dashboard_model.dart';

abstract class DashboardRepository{
  Future<Either<Failure, DashboardModel>> fetch();
}

class DashboardRepositoryImpl extends DashboardRepository{
  DashboardRepositoryImpl({required this.dashboardRemoteDatabase});

  final DashboardRemoteDatabase dashboardRemoteDatabase;

  @override
  Future<Either<Failure, DashboardModel>> fetch() async{
    try {
      final response = await dashboardRemoteDatabase.fetch();
      return Right(response);
    } catch (e, s) {
      return Left(FailureToMessage.returnLeftError(e, s));
    }
  }

}