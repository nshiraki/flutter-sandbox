import 'package:flutter/material.dart';

/// バッテリーレベルを表示するUI
///
/// [value]Battery Serviceから取得したキャラクタリスティックの値
class BatteryLevel extends StatelessWidget {
  const BatteryLevel({Key? key, required this.value}) : super(key: key);
  final int? value;
  final double _size = 200;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // プログレスに割り当てるアニメーション
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: _getProgressValue()),
          duration: const Duration(milliseconds: 500),
          builder: (context, double value, _) => SizedBox(
            width: _size,
            height: _size,
            // プログレス表示
            child: CircularProgressIndicator(
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
              backgroundColor: Colors.red,
              value: value,
              strokeWidth: 16,
            ),
          ),
        ),
        // 数値のテキスト表示
        Text(
          _getDisplayText(),
          style: const TextStyle(fontSize: 48, color: Colors.blue),
        ),
      ],
    );
  }

  /// 表示用の文字列を返却
  String _getDisplayText() => '${value ?? '---'}%';

  /// プログレスで利用する値を返却
  double _getProgressValue() {
    if (value == null) {
      return 0;
    }
    // 0.0 - 1.0の値に変換して返却
    return value! / 100;
  }
}
