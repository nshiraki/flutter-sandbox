import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_ex/main.dart';

/// 設定画面
class SettingsPage extends ConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Page'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          children: [
            CheckboxListTile(
                title: const Text('カウンターのボタンを無効化'),

                /// カウンターのボタンの無効化の状態を取得
                value: ref.watch(counterProvider).isDisableCounter,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (value) {
                  ref.read(counterProvider.notifier).setIsDisable(value!);
                }),
          ],
        ),
      ),
    );
  }
}
