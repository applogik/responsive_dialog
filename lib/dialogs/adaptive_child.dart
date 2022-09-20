import 'package:flutter/material.dart';

class AdaptiveChild extends StatelessWidget {
  const AdaptiveChild({
    Key? key,
    required this.child,
    required this.constraints,
    required this.shape,
    this.backgroundColor,
  }) : super(key: key);

  final Widget child;
  final BoxConstraints? constraints;
  final Color? backgroundColor;
  final ShapeBorder? shape;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, dimens) {
        if (dimens.maxWidth < constraints!.maxWidth ||
            dimens.maxHeight < constraints!.maxHeight) {
          return Material(
            color: backgroundColor,
            child: child,
          );
        }
        return Center(
          child: ConstrainedBox(
            constraints: constraints!,
            child: Dialog(
              shape: shape,
              child: Material(
                shape: shape,
                color: backgroundColor,
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }
}
