import 'dart:math';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'card_notifier.freezed.dart';

@freezed
class CardState with _$CardState {
  const factory CardState({
    @Default(0) int ptOfCard1,
    @Default(0) int ptOfCard2,
    @Default(0) int ptOfCard3,
    @Default(0) int ptOfCard4,
    @Default(0) int totalPt,
    @Default(false) bool isOpenCard1,
    @Default(false) bool isOpenCard2,
    @Default(false) bool isOpenCard3,
    @Default(false) bool isOpenCard4,
    @Default(0) double angle1,
    @Default(0) double angle2,
    @Default(0) double angle3,
    @Default(0) double angle4,
  }) = _CardState;
}

final cardNotifierProvider =
    StateNotifierProvider.autoDispose<CardNotifier, CardState>((ref) {
  return CardNotifier(ref.read);
});

class CardNotifier extends StateNotifier<CardState> {
  CardNotifier(this._read) : super(const CardState());
  // Reader 型をフィールドに持っておくことで、HomePageNotifierから他のProviderを読み取ることができるようになります
  // ignore: unused_field
  final Reader _read;

  void Function()? toOpenCard1() {
    state = state.copyWith(
      isOpenCard1: true,
      ptOfCard1: Random().nextInt(25) + 1,
      angle1: (state.angle1 + pi) % (2 * pi),
    );
  }

  void Function()? toOpenCard2() {
    state = state.copyWith(
      isOpenCard2: true,
      ptOfCard2: Random().nextInt(25) + 1,
      angle2: (state.angle2 + pi) % (2 * pi),
    );
  }

  void Function()? toOpenCard3() {
    state = state.copyWith(
      isOpenCard3: true,
      ptOfCard3: Random().nextInt(25) + 1,
      angle3: (state.angle3 + pi) % (2 * pi),
    );
  }

  void Function()? toOpenCard4() {
    state = state.copyWith(
      isOpenCard4: true,
      ptOfCard4: Random().nextInt(25) + 1,
      angle4: (state.angle4 + pi) % (2 * pi),
    );
  }

  Future<void> toShowDialog(BuildContext context) async {
    if (state.isOpenCard1 &&
        state.isOpenCard2 &&
        state.isOpenCard3 &&
        state.isOpenCard4) {
      state = state.copyWith(
        totalPt: state.ptOfCard1 +
            state.ptOfCard2 +
            state.ptOfCard3 +
            state.ptOfCard4,
      );
      await Future.delayed(const Duration(milliseconds: 500));
      _showDialog(context);
      await Future.delayed(const Duration(milliseconds: 800));
      state = state.copyWith(
        isOpenCard1: false,
        isOpenCard2: false,
        isOpenCard3: false,
        isOpenCard4: false,
      );
    }
  }

  Future<Widget?> _showDialog(BuildContext context) {
    return showDialog<Widget>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          title: Center(
            child: Text.rich(
              TextSpan(
                text: '${state.totalPt}',
                style: Theme.of(context).textTheme.headline3!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                children: const [
                  TextSpan(
                    text: "pt",
                    style: TextStyle(fontSize: 24),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
