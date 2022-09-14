/// 簡単な計算処理を行うUtilクラス
class Calculator {
  /// Utilクラスのインスタンス化を防ぐ
  Calculator._() {
    throw AssertionError("private Constructor");
  } // private constructor

  /// 引数で渡された、数値形式の文字列を加算し結果を文字列で返却する
  /// [num1]加算する値
  /// [num2]加算する値
  /// [return] 加算した結果を数値形式の文字列で返却。引数が不正値の場合、nullを返却
  static String? calcAdd(String num1, String num2) {
    if (double.tryParse(num1) != null && double.tryParse(num2) != null) {
      return '${double.parse(num1) + double.parse(num2)}';
    }
    return null;
  }
}
