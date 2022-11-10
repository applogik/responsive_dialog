import 'dart:ui';

import 'package:flutter/material.dart';
import 'default_dialog.dart';

Future<T?> showResponsiveDialog<T>({
  required BuildContext context,
  required Widget Function(BuildContext context) builder,
  ShapeBorder? shape,
  BoxConstraints? constraints,
  Color? backgroundColor,
  bool adaptive = true,
  bool barrierDismissible = true,
  Color? barrierColor = Colors.black54,
  String? barrierLabel,
  bool useSafeArea = true,
  bool useRootNavigator = true,
  RouteSettings? routeSettings,
  Offset? anchorPoint,
  ImageFilter? filter,
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

  T? result;

  result = await showDialog<T?>(
    barrierDismissible: barrierDismissible,
    context: context,
    useSafeArea: useSafeArea,
    useRootNavigator: useRootNavigator,
    barrierColor: barrierColor,
    barrierLabel: barrierLabel,
    routeSettings: routeSettings,
    anchorPoint: anchorPoint,
    builder: (BuildContext context) => DefaultDialog(
      adaptive: adaptive,
      barrierDismissible: barrierDismissible,
      shape: shape,
      backgroundColor: backgroundColor,
      constraints: constraints,
      filter: filter,
      child: builder(context),
    ),
  );

  if (result != null) {
    return result;
  }
  return null;
}
