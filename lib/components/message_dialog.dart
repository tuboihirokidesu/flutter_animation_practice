import 'package:flutter/material.dart';

void showMessageDialog(
  BuildContext context, {
  bool isDismissible = true,
  String? title,
  String? content,
  String? btnText,
  VoidCallback? onTap,
}) {
  _showDialog(
    context,
    isDismissible: isDismissible,
    title: title != null ? Text(title) : null,
    content: content != null ? Text(content) : null,
    rightText: Text(btnText ?? 'OK'),
    rightTap: onTap,
  );
}

void showSelectDialog(
  BuildContext context, {
  bool isDismissible = false,
  String? title,
  String? content,
  String? leftText,
  String? rightText,
  VoidCallback? leftTap,
  VoidCallback? rightTap,
}) {
  _showDialog(
    context,
    isDismissible: isDismissible,
    title: title != null ? Text(title) : null,
    content: content != null ? Text(content) : null,
    leftText: Text(leftText ?? 'no'),
    rightText: Text(
      rightText ?? 'yes',
      style: const TextStyle(fontWeight: FontWeight.bold),
    ),
    leftTap: leftTap,
    rightTap: rightTap,
  );
}

void _showDialog(
  BuildContext context, {
  bool isDismissible = true,
  Text? title,
  Text? content,
  Text? leftText,
  Text? rightText,
  VoidCallback? leftTap,
  VoidCallback? rightTap,
  double radius = 8,
}) {
  showDialog<AlertDialog>(
      context: context,
      barrierDismissible: isDismissible,
      builder: (_) => MessageDialog(
            title: title,
            content: content,
            leftText: leftText,
            leftTap: leftTap,
            rightText: rightText,
            rightTap: rightTap,
            radius: radius,
          ));
}

class MessageDialog extends StatelessWidget {
  const MessageDialog({
    this.title,
    this.content,
    this.leftText,
    this.rightText,
    this.leftTap,
    this.rightTap,
    this.radius = 0,
  });

  final Text? title;
  final Text? content;
  final Text? leftText;
  final Text? rightText;
  final VoidCallback? leftTap;
  final VoidCallback? rightTap;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title,
      titleTextStyle: const TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.bold,
      ),
      content: content,
      contentTextStyle: const TextStyle(
        color: Colors.grey,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius!))),
      actions: _actions(context),
    );
  }

  List<Widget> _actions(BuildContext context) {
    final actions = <Widget>[];
    if (leftText != null) {
      actions.add(TextButton(
        onPressed: () {
          Navigator.pop(context);
          if (leftTap != null) {
            _waitAndCallback(leftTap!);
          }
        },
        child: leftText!,
      ));
    }
    if (rightText != null) {
      actions.add(TextButton(
        onPressed: () {
          Navigator.pop(context);
          if (rightTap != null) {
            _waitAndCallback(rightTap!);
          }
        },
        child: rightText!,
      ));
    }
    return actions;
  }

  /// わずかな時間だけ待ってからコールバックを実行する
  ///
  /// コールバックがpopの場合に連続したpopとなって失敗するのを防ぐ
  /// https://github.com/flutter/flutter/pull/17828/files
  void _waitAndCallback(VoidCallback callback) {
    Future<void>.delayed(const Duration(milliseconds: 50), callback);
  }
}
