
import 'dart:developer';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:rgt_assessment/src/features/dashboard/domain/usecases/fetch.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/service_locator.dart';
import '../../../../../core/usecases/usecase.dart';
import 'dashboard_state.dart';

class DashboardCubit extends HydratedCubit<DashboardState>{
  DashboardCubit() : super(const DashboardState());

  final _fetchDashboard = sl.get<FetchDashboard>();

  Future<void> fetchDashboardData() async{
    emit(state.copyWith(status: DashboardStatus.loading));

    final result = await _fetchDashboard(NoParams());

    result.fold((left) {
      emit(state.copyWith(status: DashboardStatus.failure));

      log(FailureToMessage.mapFailureToMessage(left));

    }, (right) {
      emit(
        state.copyWith(
          status: DashboardStatus.success,
          dashboardData: right,
        ),
      );
    });
  }

  @override
  fromJson(Map<String, dynamic> json) => DashboardState.fromJson(json);

  @override
  Map<String, dynamic> toJson(state) => state.toJson();
}