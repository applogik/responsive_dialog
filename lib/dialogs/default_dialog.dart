import 'package:adaptive_dialog/dialogs/adaptive_child.dart';
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
  }) : super(key: key);

  final bool routedView;
  final bool adaptive;
  final bool? barrierDismissible;
  final ShapeBorder? shape;
  final Color? backgroundColor;
  final BoxConstraints? constraints;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (adaptive) {
      return AdaptiveChild(
        constraints: constraints,
        shape: shape,
        child: Scaffold(
          backgroundColor: backgroundColor,
          body: Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 20,
              left: 20,
              right: 20,
            ),
            child: child,
          ),
        ),
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
