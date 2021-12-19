import 'package:flutter/material.dart';
import 'package:flutter_animation/UI/car_app/components/door_lock.dart';
import 'package:flutter_animation/UI/car_app/components/navigation_bar.dart';
import 'package:flutter_animation/UI/car_app/home/car_app_home_notifier.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CarAppHomePage extends HookConsumerWidget {
  const CarAppHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useAnimationController();
    final state = ref.watch(carAppHomeNotifierProvider);
    final notifier = ref.watch(carAppHomeNotifierProvider.notifier);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Scaffold(
          bottomNavigationBar: TeslaBottomNavigationBar(
            onTap: notifier.onBottomNavigationTabChange,
            selectedTab: state.selectedBottomNab,
          ),
          body: SafeArea(
            child: LayoutBuilder(
              builder: (context, constrains) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: constrains.maxHeight * 0.1),
                      child: SvgPicture.asset(
                        "assets/icons/Car.svg",
                        width: double.infinity,
                      ),
                    ),
                    Positioned(
                      left: constrains.maxWidth * 0.05,
                      child: DoorLock(
                        isLock: state.isLeftDoorLock,
                        press: notifier.updateLeftDoorLock,
                      ),
                    ),
                    Positioned(
                      top: constrains.maxWidth * 0.13,
                      child: DoorLock(
                        isLock: state.isTopDoorLock,
                        press: notifier.updateTopDoorLock,
                      ),
                    ),
                    Positioned(
                      right: constrains.maxWidth * 0.05,
                      child: DoorLock(
                        isLock: state.isRightDoorLock,
                        press: notifier.updateRightDoorLock,
                      ),
                    ),
                    Positioned(
                      bottom: constrains.maxWidth * 0.13,
                      child: DoorLock(
                        isLock: state.isBottomDoorLock,
                        press: notifier.updateBottomDoorLock,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
