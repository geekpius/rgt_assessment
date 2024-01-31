import 'package:flutter/material.dart';
import 'package:rgt_assessment/core/extensions/widget/text_extension.dart';

import '../../../../constants/colors.dart';
import '../../../../shared_widgets/horizontal_space.dart';
import '../../../../shared_widgets/svg_icon.dart';

class MedicationCard extends StatelessWidget {
  const MedicationCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.medicationTakenAt,
  });

  final String title;
  final String subtitle;
  final Map<String, dynamic> medicationTakenAt;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 206,
      height: 152,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 2,
            offset: Offset(0, 1),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 3,
            offset: Offset(0, 1),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title).bold().color(kGreysBlue900).fontSize(14.0),
              Text(subtitle).regular().color(kGreysBlue500).fontSize(14.0),
            ],
          ),
          Row(
            children: [
              CircleAvatar(
                maxRadius: 16.0,
                backgroundColor: (medicationTakenAt['morning']?? false)? kGreysPrimary50:Colors.transparent,
                child: const ZSvgIcon(
                  'sunrise.svg',
                  size: 16,
                ),
              ),
              const HSpace(width: 16.0),
              CircleAvatar(
                maxRadius: 16.0,
                backgroundColor: (medicationTakenAt['afternoon']?? false)? kGreysPrimary50:Colors.transparent,
                child: const ZSvgIcon(
                  'sun.svg',
                  size: 16,
                ),
              ),
              const HSpace(width: 16.0),
              CircleAvatar(
                maxRadius: 16.0,
                backgroundColor: (medicationTakenAt['evening']?? false)? kGreysPrimary50:Colors.transparent,
                child: const ZSvgIcon(
                  'moon.svg',
                  size: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
