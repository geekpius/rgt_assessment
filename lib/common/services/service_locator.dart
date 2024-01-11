

import 'package:get_it/get_it.dart';
import 'package:rgt_assessment/src/dashboard/domain/repositories/dashboard_repository.dart';

import '../../src/dashboard/domain/data_sources/dashboard_data_source.dart';


GetIt sl = GetIt.instance;

void setUpGetItServiceLocator(){
  sl.registerLazySingleton<DashboardRepositoryImpl>(() => DashboardRepositoryImpl());
  sl.registerLazySingleton<DashboardDataSource>(() => DashboardDataSource());
}