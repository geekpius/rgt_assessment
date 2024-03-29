
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgt_assessment/core/extensions/widget/padding_extension.dart';
import 'package:rgt_assessment/core/extensions/widget/text_extension.dart';

import '../../../../../core/routes/app_navigator.dart';
import '../../../../../core/utils/app_dialog_util.dart';
import '../../../../../core/utils/helpers_util.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';
import '../../../../shared_widgets/error_widget.dart';
import '../../../../shared_widgets/horizontal_space.dart';
import '../../../../shared_widgets/vertical_space.dart';
import '../../domain/entities/activity_chart_model.dart';
import '../cubit/dashboard_cubit.dart';
import '../cubit/dashboard_state.dart';
import '../widgets/activities.dart';
import '../widgets/activity_chart.dart';
import '../widgets/header.dart';
import '../widgets/medication_carousel.dart';
import '../widgets/top_actions.dart';
import '../widgets/tracking_carousel.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      await context.read<DashboardCubit>().fetchDashboardData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocConsumer<DashboardCubit, DashboardState>(
            listener: (context, state) {
              if (state.status == DashboardStatus.loading) {
                 AppDialogUtil.loadingDialog(context);
              }
              if (state.status == DashboardStatus.success) {
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  AppNavigator.pop(context);
                });
              }
            },
            builder: (context, state) {
              if(state.status == DashboardStatus.failure){
                return const ApiErrorWidget();
              }

              final activities = state.dashboardData?.activities?? [];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VSpace(height: 16.0),
                  const Header().paddingSymmetric(horizontal: 4.0),
                  const VSpace(height: 16.0),
                  const TopActions().paddingSymmetric(vertical: 8.0),
                  const VSpace(height: 16.0),
                   ActivityChart(
                    dataSource: activities.map((obj) => ActivityChartModel(obj.text, obj.count.toDouble(), HelpersUtil.getColorFromHex(obj.colorCode))).toList(),
                  ),
                  const VSpace(height: 24.0),
                  Activities(
                    activities: activities,
                  ),

                  const VSpace(height: 48.0),
                  const Text('Active medications').bold().color(kGreysBlue900).fontSize(15).height(20, 15).paddingSymmetric(horizontal: 4.0),
                  const VSpace(height: 8.0),
                  MedicationCarousel(
                    medications: state.dashboardData?.medications?? [],
                  ),

                  const VSpace(height: 56.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Tracking Measures').bold().color(kGreysBlue900).fontSize(15).height(20, 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'See All',
                                  style: kRegularFontStyle.copyWith(
                                    color: kGreysBlue700,
                                    fontSize: 14,
                                  ),
                                ),
                                TextSpan(
                                  text: ' 15',
                                  style: kRegularFontStyle.copyWith(
                                    color: kGreysBlue500,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.right,
                          ),
                          const HSpace(width: 4.0),
                          const Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 16.0,
                            color: kGreysCool500,
                          ),
                        ],
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 4.0),
                  const VSpace(height: 8.0),
                  TrackingCarousel(
                    measures: state.dashboardData?.measures?? [],
                  ),

                  VSpace(height: MediaQuery.of(context).size.height*0.12),
                ],
              ).paddingSymmetric(horizontal: 12.0);
            }
          ),
        ),
      ),
    );
  }
}
