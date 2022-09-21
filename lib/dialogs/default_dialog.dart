import 'dart:ui';

import 'package:responsive_dialog/dialogs/adaptive_child.dart';
import 'package:flutter/material.dart';

class DefaultDialog extends StatelessWidget {
  const DefaultDialog({
    Key? key,
    required this.child,
    this.routedView = false,
    this.adaptive = false,
    this.barrierDismissible,
    this.shape,
    this.backgroundColor,
    this.constraints,
    this.filter,
  }) : super(key: key);

  final bool routedView;
  final bool adaptive;
  final bool? barrierDismissible;
  final ShapeBorder? shape;
  final Color? backgroundColor;
  final BoxConstraints? constraints;
  final Widget child;
  final ImageFilter? filter;

  @override
  Widget build(BuildContext context) {
    if (filter != null) {
      return BackdropFilter(
        filter: filter!,
        child: adaptive
            ? AdaptiveChild(
                constraints: constraints,
                shape: shape,
                child: child,
              )
            : AlertDialog(
                backgroundColor: backgroundColor,
                shape: shape,
                content: Container(
                  constraints: constraints,
                  child: child,
                ),
              ),
      );
    }
    if (adaptive) {
      return AdaptiveChild(
        constraints: constraints,
        shape: shape,
        child: child,
      );
    } else {
      return AlertDialog(
        backgroundColor: backgroundColor,
        shape: shape,
        content: Container(
          constraints: constraints,
          child: child,
        ),
      );
    }
  }
}
