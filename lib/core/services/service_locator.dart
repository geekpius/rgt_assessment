

import 'package:get_it/get_it.dart';
import 'package:rgt_assessment/src/features/dashboard/domain/usecases/fetch.dart';

import '../../src/features/dashboard/data/databases/remote_database/dashboard_remote_database.dart';
import '../../src/features/dashboard/data/repositories/dashboard_repository.dart';
import '../usecases/usecase.dart';



GetIt sl = GetIt.instance;

void setUpGetItServiceLocator(){
  sl..registerFactory(() => DashboardRemoteDatabaseImpl())
  ..registerLazySingleton<DashboardRepository>(() => DashboardRepositoryImpl(dashboardRemoteDatabase: sl()))
  ..registerLazySingleton<UseCase>(() => FetchDashboard(sl()));
}