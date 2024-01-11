import 'package:flutter/material.dart';
import 'package:rgt_assessment/common/extensions/widget/flexible_extension.dart';
import 'package:rgt_assessment/common/extensions/widget/padding_extension.dart';
import 'package:rgt_assessment/common/extensions/widget/text_extension.dart';
import 'package:rgt_assessment/common/shared_widgets/horizontal_space.dart';
import 'package:rgt_assessment/src/dashboard/domain/models/measure_model.dart';

import '../../../common/constants/colors.dart';


class TrackingCard extends StatelessWidget {
  const TrackingCard({
    super.key,
    required this.measure,
  });

  final MeasureModel measure;

  @override
  Widget build(BuildContext context) {
    if(measure.isTrack){
      return Container(
        height: 195,
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
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: kGreysBlue200))
              ),
              child: Text(measure.date).regular().color(kGreysBlue900).fontSize(14.0).height(16.0, 14),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(measure.title).bold().color(kGreysBlue900).fontSize(15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('${measure.rate} ${measure.unit}').regular().color(kGreysRed500).fontSize(15.0),
                        const HSpace(width: 8.0),
                        DecoratedBox(
                          decoration: BoxDecoration(
                              color: kGreysRed50,
                              borderRadius: BorderRadius.circular(100)
                          ),
                          child: Text(measure.status).bold().color(kGreysRed500).fontSize(14.0).paddingSymmetric(
                            horizontal: 4.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ).flexible(),

                SizedBox(
                  height: 70,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      SizedBox(
                        height: 20,
                        child: Row(
                          children: [
                            Container(
                              width: (MediaQuery.of(context).size.width-28) * 0.2,
                              height: 2,
                              color: kGreysRed500,
                            ).flexible(),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.35,
                              height: 2,
                              color: kGreysGreen500,
                            ),
                            Container(
                              width: (MediaQuery.of(context).size.width-28) * 0.2,
                              height: 2,
                              color: kGreysRed500,
                            ).flexible(),
                          ],
                        ),
                      ),

                      Positioned(
                        top: 0,
                        left: 8,
                        child: CustomPaint(
                          painter: CustomArrowShape(),
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("${measure.rate} ${measure.unit}").regular().color(kGreysBlue900),
                          ),
                        ),
                      ),

                      Positioned(
                        left: 40,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              color: kGreysWhite,
                              shape: BoxShape.circle,
                              border: Border.all(color: kGreysCool300)
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                Text('Last test result: ${measure.lastTestResult}').regular().color(kGreysBlue500).fontSize(14.0).flexible(),
              ],
            ).paddingAll(16.0).flexible(),
          ],
        ),
      );
    }

    return Container(
      width: 232,
      height: 192,
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
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: kGreysBlue200))
            ),
            child: Text(measure.date).regular().color(kGreysBlue900).fontSize(14.0).height(16.0, 14),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(measure.title).bold().color(kGreysBlue900).fontSize(15.0),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: kGreysGreen50,
                      borderRadius: BorderRadius.circular(100)
                    ),
                    child: Text(measure.status).bold().color(kGreysGreen600).fontSize(14.0).paddingSymmetric(
                      horizontal: 4.0,
                    ),
                  ),
                ],
              ).flexible(),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(measure.rate).bold().fontSize(24.0).color(kGreysBlue900).paddingOnly(right: 4.0),
                      Text(measure.unit).regular().fontSize(14.0).color(kGreysBlue400).height(16, 14),
                    ],
                  ).flexible(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Image.asset('assets/images/${measure.extra['icon']}', width: 19, height: 19,).paddingOnly(right: 2),
                          Text(measure.extra['name']?? '').regular().color(kGreysBlue500).fontSize(14.0),
                        ],
                      ),
                      if(measure.extra['record'] > 0) Text('+${measure.extra['record']} Record').semiBold().color(kGreysPrimary600).fontSize(12.0)
                    ],
                  ).flexible(),
                ],
              ).flexible(),
            ],
          ).paddingAll(16.0).flexible(),
        ],
      ),
    );
  }
}


class CustomArrowShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = kGreysBlue400
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    const double triangleH = 10;
    const double triangleW = 25.0;
    final double width = size.width;
    final double height = size.height;

    final Path trianglePath = Path()
      ..moveTo(width / 2 - triangleW / 2, height)
      ..lineTo(width / 2, triangleH + height)
      ..lineTo(width / 2 + triangleW / 2, height)
      ..lineTo(width / 2 - triangleW / 2, height);
    canvas.drawPath(trianglePath, paint);
    final borderRadius = BorderRadius.circular(8);
    final Rect rect = Rect.fromLTRB(0, 0, width, height);
    final RRect outer = borderRadius.toRRect(rect);
    canvas.drawRRect(outer, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
