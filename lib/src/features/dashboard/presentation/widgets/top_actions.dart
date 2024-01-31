import 'package:flutter/material.dart';
import 'package:rgt_assessment/core/extensions/widget/padding_extension.dart';
import 'package:rgt_assessment/core/extensions/widget/text_extension.dart';

import '../../../../constants/colors.dart';
import '../../../../shared_widgets/app_badge.dart';
import '../../../../shared_widgets/horizontal_space.dart';
import '../../../../shared_widgets/svg_icon.dart';
import '../../../../shared_widgets/vertical_space.dart';

class TopActions extends StatelessWidget {
  const TopActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            AppBadge(
              badgeColor: kGreysRed500,
              badgeContent: const Text('2').bold().fontSize(14).color(kGreysWhite),
              padding: const EdgeInsets.all(8),
              child: Container(
                height: 68,
                width: 68,
                decoration: BoxDecoration(
                  color: kGreysCyan400,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const ZSvgIcon(
                  'calendar.svg',
                  size: 16.0,
                ).paddingAll(16.0),
              ),
            ),
            const VSpace(height: 8.0),
            const Text('Visits').regular().color(kGreysBlue900).fontSize(14).height(16, 14).alignText(TextAlign.center),
          ],
        ),
        const HSpace(width: 24.0),
        Column(
          children: [
            Container(
              height: 68,
              width: 68,
              decoration: BoxDecoration(
                color: kGreysBlue,
                borderRadius: BorderRadius.circular(24),
              ),
              child: const CircleAvatar(
                maxRadius: 16,
                backgroundColor: Colors.transparent,
                child: ZSvgIcon(
                  'bottle.svg',
                  size: 32.0,
                ),
              ),
            ),
            const VSpace(height: 8.0),
            const Text('Medications').regular().color(kGreysBlue900).fontSize(14).height(16, 14),
          ],
        ),
        const HSpace(width: 24.0),
        Column(
          children: [
            Container(
              height: 68,
              width: 68,
              decoration: BoxDecoration(
                color: kGreysYellow400,
                borderRadius: BorderRadius.circular(24),
              ),
              child: const ZSvgIcon(
                'injections.svg',
                size: 16.0,
              ).paddingAll(16.0),
            ),
            const VSpace(height: 8.0),
            const Text('Vaccinations').regular().color(kGreysBlue900).fontSize(14).height(16, 14),
          ],
        ),
      ],
    );
  }
}
