import 'package:flutter/material.dart';

import '../constants/colors.dart';

class SliderIndicator extends StatelessWidget {
  const SliderIndicator({super.key, required this.isActive,});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 8,
      height: 8,
      decoration: ShapeDecoration(
        color: isActive? kGreysPrimary600 : const Color(0xFFD9D9D9),
        shape: const OvalBorder(),
      ),
    );
  }
}
