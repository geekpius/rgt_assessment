import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';
import '../../domain/entities/activity_chart_model.dart';

class ActivityChart extends StatelessWidget {
  const ActivityChart({super.key, required this.dataSource,});

  final List<ActivityChartModel> dataSource;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SfCircularChart(
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <CircularSeries<ActivityChartModel, String>>[
              DoughnutSeries<ActivityChartModel, String>(
                dataSource: dataSource,
                xValueMapper: (ActivityChartModel data, _) => data.x,
                yValueMapper: (ActivityChartModel data, _) => data.y,
                name: 'Activities',
                innerRadius: '78%',
                radius: '90%',
              ),
            ],
          palette: dataSource.map((obj) => obj.color ).toList(),
          margin: EdgeInsets.zero,
        ),
        RichText(
          text: TextSpan(
            text: 'Upcoming\n',
            style: kRegularFontStyle.copyWith(
              fontSize: 15.0,
              color: kGreysBlue900,
              height: 20/15.0
            ),
            children: [
              TextSpan(
                text: '${dataSource.length} Activities',
                style: kBoldFontStyle.copyWith(
                  fontSize: 15.0,
                  color: kGreysBlue900,
                  height: 20/15.0
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

