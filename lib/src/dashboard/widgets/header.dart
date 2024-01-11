import 'package:flutter/material.dart';
import 'package:rgt_assessment/common/extensions/widget/text_extension.dart';

import '../../../common/constants/colors.dart';
import '../../../common/shared_widgets/app_badge.dart';
import '../../../common/shared_widgets/svg_icon.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Hello, Shmuel').semiBold().color(kGreysBlue900).fontSize(18).height(28, 18),

        const AppBadge(
          badgeColor: kGreysGreen500,
          padding: EdgeInsets.all(8),
          child: ZSvgIcon(
            'bell.svg',
            size: 24.0,
          ),
        ),
      ],
    );
  }
}
