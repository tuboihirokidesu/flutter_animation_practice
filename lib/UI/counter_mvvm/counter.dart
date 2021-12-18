import 'package:flutter/material.dart';
import 'package:flutter_animation/UI/counter_mvvm/counter_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // HomePageState
    final pageState = ref.watch(counterPageNotifierProvider);
    // HomePageNotifier
    final pageNotifier = ref.watch(counterPageNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0x44000000),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pageNotifier.resetAllCount,
        child: const Icon(Icons.exposure_zero),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            ListTile(
              title: Text('Main Count ${pageState.mainCount}'),
              onTap: pageNotifier.increaseMainCount,
            ),
            ListTile(
              title: Text('Sub Count ${pageState.subCount}'),
              onTap: pageNotifier.increaseSubCount,
            ),
          ],
        ),
      ),
    );
  }
}
