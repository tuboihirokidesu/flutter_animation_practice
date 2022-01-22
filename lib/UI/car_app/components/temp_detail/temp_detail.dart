import 'package:flutter/material.dart';
import 'package:flutter_animation/UI/car_app/components/temp_button.dart';
import 'package:flutter_animation/UI/car_app/components/temp_detail/temp_detail_notifier.dart';
import 'package:flutter_animation/constanins.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TempDetail extends HookConsumerWidget {
  const TempDetail({
    Key? key,
    required this.isActive,
    required this.press,
  }) : super(key: key);

  final bool isActive;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(tempDetailNotifierProvider);
    final notifier = ref.watch(tempDetailNotifierProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //NOTE: SizedBoxでラップすることでタップ時の切り替えで他のwidget(29℃とか)に影響を与えない
          SizedBox(
            height: 120,
            child: Row(
              children: [
                TempBtn(
                  isActive: isActive,
                  svgSrc: "assets/icons/coolShape.svg",
                  title: "Cool",
                  press: press,
                ),
                const SizedBox(width: defaultPadding),
                TempBtn(
                  isActive: !isActive,
                  svgSrc: "assets/icons/heatShape.svg",
                  title: "Heat",
                  activeColor: redColor,
                  press: press,
                ),
              ],
            ),
          ),
          const Spacer(),
          Column(
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: notifier.toPlusTemp,
                icon: const Icon(Icons.arrow_drop_up, size: 48),
              ),
              Text(
                "${state.temp}" "\u2103",
                style: const TextStyle(fontSize: 86),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: notifier.toMinusTemp,
                icon: const Icon(Icons.arrow_drop_down, size: 48),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
