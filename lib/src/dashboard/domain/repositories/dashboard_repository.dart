
import 'package:dartz/dartz.dart';
import 'package:rgt_assessment/src/dashboard/domain/data_sources/dashboard_data_source.dart';
import 'package:rgt_assessment/src/dashboard/domain/models/dashboard_model.dart';

import '../../../../common/services/service_locator.dart';
import '../../../../core/errors/failure.dart';

abstract class DashboardRepository{
  Future<Either<Failure, DashboardModel>> fetchDashboardData();
}

class DashboardRepositoryImpl extends DashboardRepository{

  final _dashboardDataSource = sl.get<DashboardDataSource>();

  @override
  Future<Either<Failure, DashboardModel>> fetchDashboardData() async{
    try {
      final response = await _dashboardDataSource.fetchDashboardData();
      return Right(response);
    } catch (e, s) {
      return Left(FailureToMessage.returnLeftError(e, s));
    }
  }

}