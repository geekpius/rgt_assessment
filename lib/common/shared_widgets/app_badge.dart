import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badge;
import 'package:rgt_assessment/common/constants/colors.dart';

class AppBadge extends StatelessWidget {
  const AppBadge({
    super.key,
    required this.child,
    this.badgeContent,
    this.badgeColor = kGreysWhite,
    this.position,
    this.showBadge = true,
    this.padding = const EdgeInsets.all(5),
    this.borderSide,
  });

  final Widget? child;
  final Widget? badgeContent;
  final Color badgeColor;
  final badge.BadgePosition? position;
  final EdgeInsetsGeometry padding;
  final bool showBadge;
  final BorderSide? borderSide;

  @override
  Widget build(BuildContext context) {
    return badge.Badge(
      position: position,
      badgeContent: badgeContent,
      badgeStyle: badge.BadgeStyle(
        badgeColor: badgeColor,
        padding: padding,
        elevation: 0,
        borderSide: borderSide?? const BorderSide(color: kGreysWhite, width: 2,),
      ),
      showBadge: showBadge,
      child: child,
    );
  }
}
