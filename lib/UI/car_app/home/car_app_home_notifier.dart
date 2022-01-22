import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_app_home_notifier.freezed.dart';

@freezed
class CarAppHomeState with _$CarAppHomeState {
  const factory CarAppHomeState({
    /// Main Count
    @Default(true) bool isLeftDoorLock,
    @Default(true) bool isTopDoorLock,
    @Default(true) bool isRightDoorLock,
    @Default(true) bool isBottomDoorLock,
    @Default(0) int selectedBottomNab,
    @Default(true) bool isCoolSelected,
    @Default(false) bool isShowTyres,
    @Default(false) bool isShowTyreStatus,
  }) = _CarAppHomeState;
}

final carAppHomeNotifierProvider =
    StateNotifierProvider.autoDispose<CarAppHomeNotifier, CarAppHomeState>(
        (ref) {
  return CarAppHomeNotifier(ref.read);
});

class CarAppHomeNotifier extends StateNotifier<CarAppHomeState> {
  CarAppHomeNotifier(this._read) : super(const CarAppHomeState());
  // Reader 型をフィールドに持っておくことで、HomePageNotifierから他のProviderを読み取ることができるようになります
  final Reader _read;

  void onBottomNavigationTabChange(int index) {
    state = state.copyWith(selectedBottomNab: index);
  }

  void updateLeftDoorLock() {
    state = state.copyWith(isLeftDoorLock: !state.isLeftDoorLock);
  }

  void updateTopDoorLock() {
    state = state.copyWith(isTopDoorLock: !state.isTopDoorLock);
  }

  void updateRightDoorLock() {
    state = state.copyWith(isRightDoorLock: !state.isRightDoorLock);
  }

  void updateBottomDoorLock() {
    state = state.copyWith(isBottomDoorLock: !state.isBottomDoorLock);
  }

  void updateCoolSelectedTab() {
    state = state.copyWith(isCoolSelected: !state.isCoolSelected);
  }

  void showTyresController(int index) {
    if (state.selectedBottomNab != 3 && index == 3) {
      Future.delayed(const Duration(milliseconds: 400), () {
        state = state.copyWith(isShowTyres: true);
      });
    } else {
      state = state.copyWith(isShowTyres: false);
    }
  }

  void tyreStatusController(int index) {
    if (index == 3) {
      state = state.copyWith(isShowTyreStatus: true);
    } else {
      Future.delayed(const Duration(milliseconds: 400), () {
        state = state.copyWith(isShowTyreStatus: false);
      });
    }
  }
}
