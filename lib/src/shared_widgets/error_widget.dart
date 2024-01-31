import 'package:flutter/material.dart';
import 'package:rgt_assessment/core/extensions/widget/text_extension.dart';

import '../constants/colors.dart';

class ApiErrorWidget extends StatelessWidget {
  const ApiErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Text('Something went wrong').bold().fontSize(14).color(kGreysRed500),
    );
  }
}
