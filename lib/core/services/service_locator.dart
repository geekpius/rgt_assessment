

import 'package:get_it/get_it.dart';
import 'package:rgt_assessment/src/features/dashboard/domain/usecases/fetch.dart';

import '../../src/features/dashboard/data/databases/remote_database/dashboard_remote_database.dart';
import '../../src/features/dashboard/data/repositories/dashboard_repository.dart';



GetIt sl = GetIt.instance;

void setUpGetItServiceLocator(){
  sl.registerLazySingleton<DashboardRemoteDatabase>(() => DashboardRemoteDatabaseImpl());
  sl.registerLazySingleton<DashboardRepository>(() => DashboardRepositoryImpl(dashboardRemoteDatabase: sl()));
  sl.registerLazySingleton(() => FetchDashboard(sl()));
}