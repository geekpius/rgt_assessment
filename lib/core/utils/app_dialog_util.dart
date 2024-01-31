import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';

enum DialogAction { yes, abort }

class AppDialogUtil {

  static Future<void> loadingDialog(BuildContext context) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.white.withOpacity(0.955),
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: PopScope(
              canPop: false,
              child: SimpleDialog(
                elevation: 0.0,
                contentPadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                titlePadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                backgroundColor: Colors.transparent,
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/loading.gif'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
    );
  }



}
