import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_notifier.freezed.dart';

@freezed
class CounterState with _$CounterState {
  const factory CounterState({
    /// Main Count
    @Default(0) int mainCount,

    /// Sub Count
    @Default(0) int subCount,
  }) = _CounterState;
}

final counterPageNotifierProvider =
    StateNotifierProvider.autoDispose<CounterPageNotifier, CounterState>((ref) {
  return CounterPageNotifier(ref.read);
});

class CounterPageNotifier extends StateNotifier<CounterState> {
  CounterPageNotifier(this._read) : super(const CounterState());
  // Reader 型をフィールドに持っておくことで、HomePageNotifierから他のProviderを読み取ることができるようになります
  final Reader _read;

  increaseMainCount() async {
    state = state.copyWith(mainCount: state.mainCount + 1);
  }

  // サブカウントを+1する
  increaseSubCount() async {
    state = state.copyWith(subCount: state.subCount + 1);
  }

  // すべてのカウントを0に戻す
  resetAllCount() async {
    state = state.copyWith(
      mainCount: 0,
      subCount: 0,
    );
  }
}
