import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test_ex/calculator.dart';

void main() {
  group('calcAddのテストケース', () {
    group('成功するパターン（数値は整数のみに限定している）', () {
      test('num1="100"、num2="100" で加算した場合、"200.0"が返却されること', () {
        String num1 = '100';
        String num2 = '100';
        var result = Calculator.calcAdd(num1, num2);
        expect(result, '200.0');
      });
    });

    group('失敗するパターン（数値は整数のみに限定している）', () {
      test('num1=""、num2="100" で加算した場合、nullが返却されること', () {
        String num1 = '';
        String num2 = '100';
        var result = Calculator.calcAdd(num1, num2);
        expect(result, null);
      });

      test('num1="100"、num2="" で加算した場合、nullが返却されること', () {
        String num1 = '100';
        String num2 = '';
        var result = Calculator.calcAdd(num1, num2);
        expect(result, null);
      });

      test('num1=""、num2="" で加算した場合、nullが返却されること', () {
        String num1 = '';
        String num2 = '';
        var result = Calculator.calcAdd(num1, num2);
        expect(result, null);
      });
    });
  });
}
