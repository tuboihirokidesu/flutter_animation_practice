import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'temp_detail_notifier.freezed.dart';

@freezed
class TempDetailState with _$TempDetailState {
  const factory TempDetailState({
    /// Main Count
    @Default(29) int temp,
  }) = _TempDetailState;
}

final tempDetailNotifierProvider =
    StateNotifierProvider.autoDispose<TempDetailNotifier, TempDetailState>(
        (ref) {
  return TempDetailNotifier(ref.read);
});

class TempDetailNotifier extends StateNotifier<TempDetailState> {
  TempDetailNotifier(this._read) : super(const TempDetailState());
  // Reader 型をフィールドに持っておくことで、HomePageNotifierから他のProviderを読み取ることができるようになります
  // ignore: unused_field
  final Reader _read;

  void toPlusTemp() {
    state = state.copyWith(temp: state.temp + 1);
  }

  void toMinusTemp() {
    state = state.copyWith(temp: state.temp - 1);
  }
}
