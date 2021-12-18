import 'package:flutter/material.dart';
import 'package:flutter_animation/UI/api_data/view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ApiData extends ConsumerWidget {
  const ApiData({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // FutureProviderを読み取る（取得できる型は `AsyncValue<T>`）
    final config = ref.watch(configProvider);

    return SafeArea(
      child: Scaffold(
        // AsyncValue は `.when` を使ってハンドリングする
        body: config.when(
          // 非同期処理中は `loading` で指定したWidgetが表示される
          loading: () => const CircularProgressIndicator(),
          // エラーが発生した場合に表示されるWidgetを指定
          error: (error, stack) => Text('Error: $error'),
          // 非同期処理が完了すると、取得した `config` が `data` で使用できる
          data: (user) {
            return ListTile(
              title: const Text('login'),
              subtitle: Text('${user['message'] ?? 'none'}'),
            );
          },
        ),
      ),
    );
  }
}
