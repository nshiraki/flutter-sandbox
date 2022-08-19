import 'package:flutter/material.dart';

/// デバイス情報の項目を表示するWidget
///
/// [title] タイトル
/// [subTitle] サブタイトル（省略可）
class DeviceInfoListItem extends StatelessWidget {
  final String title;
  final dynamic? subTitle;

  const DeviceInfoListItem({Key? key, required this.title, this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String text = (subTitle == null) ? title : '$title: $subTitle';

    return Container(
      padding: const EdgeInsets.only(left: 8, bottom: 8),
      alignment: Alignment.centerLeft,
      child: Text(text, style: const TextStyle(fontSize: 24)),
    );
  }
}

