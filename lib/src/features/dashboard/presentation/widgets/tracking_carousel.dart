import 'package:flutter/material.dart';
import 'package:rgt_assessment/core/extensions/widget/padding_extension.dart';
import 'package:rgt_assessment/src/features/dashboard/presentation/widgets/tracking_card.dart';

import '../../../../shared_widgets/slider_indicator.dart';
import '../../../../shared_widgets/vertical_space.dart';
import '../../domain/entities/measure_model.dart';

class TrackingCarousel extends StatelessWidget {
  TrackingCarousel({
    super.key,
    required this.measures,
  });

  final List<MeasureModel> measures;
  final selectedIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox(
          height: 195,
          child: PageView.builder(
            clipBehavior: Clip.none,
            padEnds: false,
            controller: PageController(viewportFraction:  0.90),
            itemCount: measures.length,
            itemBuilder: (_, index) {
              return TrackingCard(
                measure: measures[index],
              ).paddingOnly(right: index==measures.length-1? 0: 8.0);
            },
            onPageChanged: (index){
              selectedIndex.value = index;
            },
          ),
        ),

        const VSpace(height: 8.0),
        ValueListenableBuilder<int>(
          valueListenable: selectedIndex,
          builder: (context, indexValue, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(measures.length, (index) => SliderIndicator(isActive: index == indexValue).paddingOnly(right: (index==measures.length-1)? 0: 16.0)),
            );
          }
        ),
      ],
    );
  }
}
