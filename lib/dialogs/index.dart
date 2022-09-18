import 'package:flutter/material.dart';
import 'default_dialog.dart';

class AdaptiveDialog {
  static Future<dynamic> show({
    required BuildContext context,
    required Widget child,
    ShapeBorder? shape,
    BoxConstraints? constraints,
    Color? backgroundColor,
    bool adaptive = true,
    bool barrierDismissible = true,
  }) async {
    if (constraints == null) {
      if (adaptive) {
        constraints =
            const BoxConstraints(maxHeight: 600, minWidth: 400, maxWidth: 720);
      } else {
        constraints =
            const BoxConstraints(maxHeight: 600, minWidth: 400, maxWidth: 678);
      }
    }
    shape ??= RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0));
    backgroundColor ??= Theme.of(context).dialogBackgroundColor;

    dynamic result;
    
    result = await showDialog<dynamic>(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (BuildContext context) => DefaultDialog(
        adaptive: adaptive,
        barrierDismissible: barrierDismissible,
        shape: shape,
        backgroundColor: backgroundColor,
        constraints: constraints,
        child: child,
      ),
    );

    if (result != null) {
      return result;
    }
    return null;
  }
}
