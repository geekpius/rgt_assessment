import 'package:flutter/material.dart';

class VSpace extends StatelessWidget {
  const VSpace({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}
