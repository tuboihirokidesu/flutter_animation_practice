import 'package:flutter/material.dart';

import 'package:flutter_animation/UI/carousel/carousel.dart';
import 'package:flutter_animation/UI/api_data/api_data.dart';
import 'package:flutter_animation/components/card_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterProvider = StateProvider((ref) => 0);

class UiFlutter extends ConsumerWidget {
  const UiFlutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider.notifier);

    ref.listen<int>(
      counterProvider,
      (previous, next) {
        // Counterの数値が偶数になったときにだけダイアログを表示する
        if (next.isEven) {
          return;
        }
        showDialog<void>(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text('Current number is Odd !!'),
            );
          },
        );
      },
      // エラーハンドリング（省略可能）
      onError: (error, stackTrace) => debugPrint('$error'),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('UI in flutter')),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          CardButton(
            title: 'Carousel',
            actionTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const Carousel()));
            },
          ),
          CardButton(
            title: 'json_data',
            actionTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const ApiData()));
            },
          ),
          Center(
            child: Text(
              '${ref.watch(counterProvider)}',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          FractionallySizedBox(
            widthFactor: 0.5,
            child: ElevatedButton(
              onPressed: () => counter.state++,
              child: const Text('increment'),
            ),
          )
        ],
      ),
    );
  }
}
