import 'package:flutter/material.dart';

/// ローディング表示のWidget
///
/// [visible]表示する場合はtrue、非表示の場合はfalseを指定
class LoadingProgress extends StatelessWidget {
  final bool visible;

  const LoadingProgress({Key? key, required this.visible}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return visible
        ? Container(
            color: Colors.black.withOpacity(0.7),
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          )
        : const SizedBox.shrink();
  }
}
