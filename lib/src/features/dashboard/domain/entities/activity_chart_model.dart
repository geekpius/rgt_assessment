

import 'package:flutter/material.dart';

class ActivityChartModel{
  ActivityChartModel(this.x, this.y, [this.color=Colors.white]);

  final String x;
  final double y;
  final Color color;
}