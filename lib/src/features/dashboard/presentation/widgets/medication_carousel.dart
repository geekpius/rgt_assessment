import 'package:flutter/material.dart';
import 'package:rgt_assessment/core/extensions/widget/padding_extension.dart';

import '../../../../shared_widgets/slider_indicator.dart';
import '../../../../shared_widgets/vertical_space.dart';
import '../../domain/entities/medication_model.dart';
import 'medication_card.dart';

class MedicationCarousel extends StatelessWidget {
  MedicationCarousel({
    super.key,
    required this.medications,
  });

  final List<MedicationModel> medications;

  final selectedIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 152,
          child: PageView.builder(
            clipBehavior: Clip.none,
            padEnds: false,
            controller: PageController(viewportFraction: 0.62),
            itemCount: medications.length,
            itemBuilder: (_, index) {
              final medication = medications[index];
              return MedicationCard(
                title: medication.title,
                subtitle: medication.occurrence,
                medicationTakenAt: medication.medicationTakenAt,
              ).paddingOnly(right: index==medications.length-1? 0: 8.0);
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
                children: List.generate(medications.length, (index) => SliderIndicator(isActive: index == indexValue).paddingOnly(right: (index==medications.length-1)? 0: 16.0)),
              );
            }
        ),
      ],
    );
  }
}
