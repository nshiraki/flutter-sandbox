import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_ex/settings.dart';

/// Riverpodを利用して状態管理を行う処理を作成する

/// Stateクラス
/// - immutableな状態クラスを定義
@immutable
class CounterState {
  const CounterState({
    required this.count,
    this.isDisableCounter = false,
  });

  /// カウント値
  final int count;

  /// カウンターのボタンが無効かどうか
  final bool isDisableCounter;
}

/// 状態管理クラスの定義
/// - StateNotifierクラスを継承して状態管理クラスを定義する
class CounterStateNotifier extends StateNotifier<CounterState> {
  CounterStateNotifier(CounterState counterState)
      : super(const CounterState(count: 0));

  /// 状態を更新する
  void increment() {
    final newState = CounterState(
        count: state.count + 1, isDisableCounter: state.isDisableCounter);
    state = newState;
  }

  void setIsDisable(bool value) {
    final newState = CounterState(count: state.count, isDisableCounter: value);
    state = newState;
  }
}

/// 依存関係の注入
/// - StateNotifierProviderクラスに、状態管理クラスの依存を注入する
final counterProvider =
    StateNotifierProvider<CounterStateNotifier, CounterState>(
  (ref) => CounterStateNotifier(const CounterState(count: 0)),
);

void main() {
  runApp(
    /// Riverpodでデータの受け渡しが可能な状態にする
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

/// 状態の監視と更新
/// ConsumerWidgetを継承して状態の監視、状態の更新を行う
/// - ConsumerWidgetを継承した場合、Widget全体が再描画の対象範囲になってしまうため、
/// 再描画のパフォーマンスを考慮する場合、Consumerを利用して再描画の対象範囲を制限する
class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// 状態の監視（値の受け取り）
    /// - 再描画の対象範囲を制限する場合は、カウント数のTextの部分をConsumerに置き換える
    final CounterState counterState = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('RiverpodEx'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${counterState.count}',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: 32.0,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const SettingsPage();
                    },
                  ),
                );
              },
              child: const Text('設定画面を表示'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        /// カウンターの状態に応じて、ボタンのタップ処理を設定
        onPressed: counterState.isDisableCounter
            ? null
            : () {
                /// 状態の更新
                /// - 状態クラス（CounterStateNotifier）のメソッドを呼び出して、状態を更新する
                ref.read(counterProvider.notifier).increment();
              },
        tooltip: 'Increment',

        /// カウンターの状態に応じてアイコンを設定
        child: counterState.isDisableCounter
            ? const Icon(Icons.not_interested, color: Colors.red)
            : const Icon(Icons.add),
      ),
    );
  }
}
