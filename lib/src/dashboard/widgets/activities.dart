import 'package:flutter/material.dart';
import 'package:rgt_assessment/common/constants/colors.dart';
import 'package:rgt_assessment/common/extensions/widget/flexible_extension.dart';
import 'package:rgt_assessment/common/extensions/widget/padding_extension.dart';
import 'package:rgt_assessment/common/extensions/widget/text_extension.dart';
import 'package:rgt_assessment/common/utils/helpers_util.dart';
import 'package:rgt_assessment/src/dashboard/domain/models/activity_model.dart';

import '../../../common/shared_widgets/horizontal_space.dart';
import '../../../common/shared_widgets/svg_icon.dart';

class Activities extends StatelessWidget {
  const Activities({
    super.key,
    required this.activities
  });

  final List<ActivityModel> activities;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: activities.length,
      itemBuilder: (context, index){
        final activity = activities[index];
        return Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 16.0
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: const Border(
              left: BorderSide(color: Color(0xFFF1F5F9)),
              top: BorderSide(color: Color(0xFFF1F5F9)),
              right: BorderSide(color: Color(0xFFF1F5F9)),
              bottom: BorderSide(width: 1, color: Color(0xFFF1F5F9)),
            ),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      color: HelpersUtil.getColorFromHex(activity.colorCode),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ZSvgIcon(
                      activity.iconName,
                      size: 16,
                    ).paddingAll(6.0),
                  ),
                  const HSpace(width: 8.0),
                  Text(activity.text).semiBold().color(kGreysBlue900).fontSize(14.0).height(16, 14).flexible(),
                ],
              ).flexible(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    maxRadius: 12.0,
                    backgroundColor: HelpersUtil.getColorFromHex(activity.colorCode),
                    child: Text(activity.count.toString()).regular().color(Colors.white).fontSize(14.0).height(16, 14),
                  ),
                  const HSpace(width: 8.0),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: kGreysCool,
                    size: 16.0,
                  ),
                ],
              ),
            ],
          ),
        ).paddingOnly(bottom: 4.0);
      },
    );
  }
}
