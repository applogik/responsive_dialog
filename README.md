# Adaptive Dialog

[![Version](https://img.shields.io/pub/v/adaptive_dialog.svg)](https://pub.dev/packages/adaptive_dialog)

An `AdaptiveDialog` helps you to always ship responsive and dynamic dialogs for the perfect user-experience! You decide the dimensions of your dialog and the `AdaptiveChild` takes care of whether to show your content like a simple dialog or a full-screen page.

![Example Dialog](https://github.com/applogik/adaptive_dialog/blob/main/assets/example.gif)

## Options

| __Parameter__           | __Type__           | __Default__ | __Short description__                |
| ----------------------- | ------------------ | ----------- | ------------------------------------- |
| context | `BuildContext`     | `-`         | Required due to `showDialog`'s base. |
| builder | `Function(BuildContext context)`     | `-`         | Required to build your child. |
| shape | `ShapeBorder?`     | `RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))`         | The desired shape of your dialog. |
| constraints | `BoxConstraints?`     | `const BoxConstraints(maxHeight: 600, minWidth: 400, maxWidth: 720)`         | The max and min dimensions of your dialog. |
| backgroundColor | `Color?`     | `Theme.of(context).dialogBackgroundColor`         | The main background color of your dialog. |
| adaptive | `bool`     | `true`         | If adaptiveness should be applied. If not it only shows your content inside of an `AlertDialog`. |
| barrierDismissible | `bool`     | `true`         | Whether users can dismiss your dialog by tapping outside the dialog. |
| useSafeArea | `bool`     | `true`         | If `true` your whole dialog recognizes safe areas (could also lead to undesired layouts! Better use your own safe area widget inside your child!). |
| filter | `ImageFilter?`     | `null`         | If you want to add a desired BackdropFilter, you can pass here your `ImageFilter` to do so. |

## Getting started

To use this package, add `adaptive_dialog` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/):

```yaml
dependencies:
  adaptive_dialog: ^0.2.3
```

## Usage

Call `showAdaptiveDialog` with your desired type to return (if you want to return something).

```dart
final result = await showAdaptiveDialog<String>(
    context: context,
    builder: (context) => SizedBox(
    height: 400,
    width: 600,
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
        const Text('Hello World'),
        ElevatedButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
        ),
      ],
    ),
  ),
);
```
