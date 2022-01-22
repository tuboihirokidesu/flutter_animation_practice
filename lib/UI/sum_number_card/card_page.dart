import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_animation/UI/sum_number_card/card_notifier.dart';
import 'package:flutter_animation/constanins.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CardPage extends HookConsumerWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cardNotifierProvider);
    final notifier = ref.watch(cardNotifierProvider.notifier);

    List<int> listCard = [
      state.ptOfCard1,
      state.ptOfCard2,
      state.ptOfCard3,
      state.ptOfCard4
    ];

    List<void Function()?> onTap = [
      notifier.toOpenCard1,
      notifier.toOpenCard2,
      notifier.toOpenCard3,
      notifier.toOpenCard4,
    ];

    useEffect(() {
      WidgetsBinding.instance?.addPostFrameCallback((_) async {
        await notifier.toShowDialog(context);
      });
    }, [
      state.isOpenCard1,
      state.isOpenCard2,
      state.isOpenCard3,
      state.isOpenCard4,
    ]);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0x44000000),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constrains) {
            return GridView.builder(
              itemCount: 4,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
                childAspectRatio: constrains.maxWidth / constrains.maxHeight,
              ),
              itemBuilder: (context, index) {
                final isOpen = [
                  state.isOpenCard1,
                  state.isOpenCard2,
                  state.isOpenCard3,
                  state.isOpenCard4,
                ][index];

                final angle = [
                  state.angle1,
                  state.angle2,
                  state.angle3,
                  state.angle4,
                ];
                return GestureDetector(
                  onTap: onTap[index],
                  child: TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: angle[index]),
                    duration: defaultDuration,
                    builder: ((BuildContext context, double val, __) =>
                        Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..rotateY(val),
                          child: Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()..rotateY(math.pi),
                            child: Container(
                              padding: const EdgeInsets.all(defaultPadding),
                              decoration: BoxDecoration(
                                color: primaryColor.withOpacity(0.1),
                                border: Border.all(color: primaryColor),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(6)),
                              ),
                              child: AnimatedOpacity(
                                duration: defaultDuration1,
                                opacity: isOpen ? 1 : 0,
                                child: Center(
                                  child: Text.rich(
                                    TextSpan(
                                      text: listCard[index].toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3!
                                          .copyWith(
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
                              ),
                            ),
                          ),
                        )),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
