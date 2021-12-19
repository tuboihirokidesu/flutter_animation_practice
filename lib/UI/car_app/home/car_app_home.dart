import 'package:flutter/material.dart';
import 'package:flutter_animation/UI/car_app/components/battery_status.dart';
import 'package:flutter_animation/UI/car_app/components/door_lock.dart';
import 'package:flutter_animation/UI/car_app/components/navigation_bar.dart';
import 'package:flutter_animation/UI/car_app/home/car_app_home_notifier.dart';
import 'package:flutter_animation/constanins.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CarAppHomePage extends HookConsumerWidget {
  const CarAppHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useAnimationController();
    final _batteryAnimationController =
        useAnimationController(duration: const Duration(milliseconds: 600));
    final _animationBatteryStatus = useAnimation(_batteryAnimationController);

    final state = ref.watch(carAppHomeNotifierProvider);
    final notifier = ref.watch(carAppHomeNotifierProvider.notifier);

    useAnimation(_batteryAnimationController);

//NOTE: 必要なのか？
    // useEffect(() {
    //   return () => _batteryAnimationController.dispose();
    // }, const []);

    return AnimatedBuilder(
      animation: Listenable.merge([
        controller,
        _batteryAnimationController,
      ]),
      builder: (context, _) {
        return Scaffold(
          bottomNavigationBar: TeslaBottomNavigationBar(
            onTap: (index) {
              if (index == 1) {
                _batteryAnimationController.forward();
              } else if (state.selectedBottomNab == 1 && index != 1) {
                _batteryAnimationController.reverse(from: 0.7);
              }
              notifier.onBottomNavigationTabChange(index);
            },
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
                    AnimatedPositioned(
                      duration: defaultDuration,
                      left: state.selectedBottomNab == 0
                          ? constrains.maxWidth * 0.05
                          : constrains.maxWidth / 2,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: state.selectedBottomNab == 0 ? 1 : 0,
                        child: DoorLock(
                          isLock: state.isLeftDoorLock,
                          press: notifier.updateLeftDoorLock,
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: defaultDuration,
                      top: state.selectedBottomNab == 0
                          ? constrains.maxHeight * 0.13
                          : constrains.maxHeight / 2,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: state.selectedBottomNab == 0 ? 1 : 0,
                        child: DoorLock(
                          isLock: state.isTopDoorLock,
                          press: notifier.updateTopDoorLock,
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: defaultDuration,
                      right: state.selectedBottomNab == 0
                          ? constrains.maxWidth * 0.05
                          : constrains.maxWidth / 2,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: state.selectedBottomNab == 0 ? 1 : 0,
                        child: DoorLock(
                          isLock: state.isRightDoorLock,
                          press: notifier.updateRightDoorLock,
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: defaultDuration,
                      bottom: state.selectedBottomNab == 0
                          ? constrains.maxHeight * 0.13
                          : constrains.maxHeight / 2,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: state.selectedBottomNab == 0 ? 1 : 0,
                        child: DoorLock(
                          isLock: state.isBottomDoorLock,
                          press: notifier.updateBottomDoorLock,
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: _animationBatteryStatus,
                      child: SvgPicture.asset(
                        "assets/icons/Battery.svg",
                        width: constrains.maxWidth * 0.40,
                      ),
                    ),
                    Positioned(
                      top: 20 * (1 - _animationBatteryStatus),
                      height: constrains.maxHeight,
                      width: constrains.maxWidth,
                      child: Opacity(
                        opacity: _animationBatteryStatus,
                        child: BatteryStatus(constrains: constrains),
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
