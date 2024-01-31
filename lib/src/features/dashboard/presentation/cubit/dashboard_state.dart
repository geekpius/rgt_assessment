

import 'package:equatable/equatable.dart';

import '../../domain/entities/dashboard_model.dart';

enum DashboardStatus { initial, loading, success, failure }

class DashboardState extends Equatable{
  final DashboardModel? dashboardData;
  final DashboardStatus status;

  const DashboardState({
    this.dashboardData,
    this.status = DashboardStatus.initial,
  });

  DashboardState copyWith({
    DashboardModel? dashboardData,
    DashboardStatus? status,
  }) {
    return DashboardState(
      dashboardData: dashboardData ?? this.dashboardData,
      status: status ?? this.status,
    );
  }

  factory DashboardState.fromJson(Map<String, dynamic> json) {
    return DashboardState(
      dashboardData: DashboardModel.fromJson(json['dashboardData']?? {}),
      status: _getStatus(json['status']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dashboardData': dashboardData?.toJson(),
      'status': _getStatusString(status),
    };
  }

  // using code gen will eliminate these two functions
  static DashboardStatus _getStatus(String status){
    if(status == 'initial') return DashboardStatus.initial;
    if(status == 'loading') return DashboardStatus.loading;
    if(status == 'failure') return DashboardStatus.failure;
    return DashboardStatus.success;
  }

  static String _getStatusString(DashboardStatus status){
    if(status == DashboardStatus.initial) return 'initial';
    if(status == DashboardStatus.loading) return 'loading';
    if(status == DashboardStatus.failure) return 'failure';
    return 'success';
  }

  @override
  List<Object?> get props => [dashboardData, status];
}