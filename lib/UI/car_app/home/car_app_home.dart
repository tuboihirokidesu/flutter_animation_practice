import 'package:flutter/material.dart';

import 'package:flutter_animation/UI/car_app/components/battery_status.dart';
import 'package:flutter_animation/UI/car_app/components/door_lock.dart';
import 'package:flutter_animation/UI/car_app/components/navigation_bar.dart';
import 'package:flutter_animation/UI/car_app/components/temp_detail/temp_detail.dart';
import 'package:flutter_animation/UI/car_app/components/temp_detail/temp_detail_notifier.dart';
import 'package:flutter_animation/UI/car_app/components/tyers.dart';
import 'package:flutter_animation/UI/car_app/components/tyre_psi_card.dart';
import 'package:flutter_animation/UI/car_app/home/car_app_home_notifier.dart';
import 'package:flutter_animation/UI/car_app/models/tyre_psi.dart';
import 'package:flutter_animation/constanins.dart';
import 'package:flutter_animation/gen/assets.gen.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CarAppHomePage extends HookConsumerWidget {
  const CarAppHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useAnimationController();
    final _batteryAnimationController =
        useAnimationController(duration: const Duration(milliseconds: 600));
    final _animationBatteryStatus = useAnimation(_batteryAnimationController);
    final _tempAnimationController =
        useAnimationController(duration: const Duration(milliseconds: 600));
    final _animationCarShift = useAnimation(_tempAnimationController);

    final _tyreAnimationController =
        useAnimationController(duration: const Duration(milliseconds: 600));

    var _animationTyre1Psi = useAnimationController().view;
    var _animationTyre2Psi = useAnimationController().view;
    var _animationTyre3Psi = useAnimationController().view;
    var _animationTyre4Psi = useAnimationController().view;

    final state = ref.watch(carAppHomeNotifierProvider);
    final notifier = ref.watch(carAppHomeNotifierProvider.notifier);
    final tempDetailState = ref.watch(tempDetailNotifierProvider);

    // ignore: unused_local_variable
    List<Animation<double>>? _tyreAnimations;

    setupTyreAnimation() {
      _animationTyre1Psi = CurvedAnimation(
          parent: _tyreAnimationController, curve: const Interval(0.34, 0.5));
      _animationTyre2Psi = CurvedAnimation(
          parent: _tyreAnimationController, curve: const Interval(0.5, 0.66));
      _animationTyre3Psi = CurvedAnimation(
          parent: _tyreAnimationController, curve: const Interval(0.66, 0.82));
      _animationTyre4Psi = CurvedAnimation(
          parent: _tyreAnimationController, curve: const Interval(0.82, 1));

      _tyreAnimations = [
        _animationTyre1Psi,
        _animationTyre2Psi,
        _animationTyre3Psi,
        _animationTyre4Psi,
      ];
    }

//NOTE: 必要なのか？
    useEffect(() {
      setupTyreAnimation();
      return () => {
            _batteryAnimationController.dispose(),
            _tempAnimationController.dispose()
          };
    }, const []);

    return AnimatedBuilder(
      animation: Listenable.merge([
        controller,
        _batteryAnimationController,
        _tempAnimationController,
        _tyreAnimationController,
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

              if (index == 2) {
                _tempAnimationController.forward();
              } else if (state.selectedBottomNab == 2 && index != 2) {
                _tempAnimationController.reverse(from: 0.4);
              }

              if (index == 3) {
                _tyreAnimationController.forward();
              } else if (state.selectedBottomNab == 3 && index != 3) {
                _tyreAnimationController.reverse();
              }

              notifier.showTyresController(index);
              notifier.onBottomNavigationTabChange(index);
              notifier.tyreStatusController(index);
            },
            selectedTab: state.selectedBottomNab,
          ),
          body: SafeArea(
            child: LayoutBuilder(
              builder: (context, constrains) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: constrains.maxHeight,
                      width: constrains.maxWidth,
                    ),
                    Positioned(
                      left: constrains.maxWidth / 2 * _animationCarShift,
                      height: constrains.maxHeight,
                      width: constrains.maxWidth,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: constrains.maxHeight * 0.1),
                        child: Assets.icons.car.svg(width: double.infinity),
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
                      child: Assets.icons.battery
                          .svg(width: constrains.maxWidth * 0.40),
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
                    Positioned(
                      height: constrains.maxHeight,
                      width: constrains.maxWidth,
                      top: 60 * (1 - _animationCarShift),
                      child: Opacity(
                        opacity: _animationCarShift,
                        child: TempDetail(
                          isActive: state.isCoolSelected,
                          press: notifier.updateCoolSelectedTab,
                        ),
                      ),
                    ),
                    Positioned(
                      right: -180 * (1 - _animationCarShift),
                      child: AnimatedSwitcher(
                          duration: defaultDuration,
                          child: state.isCoolSelected
                              ? Opacity(
                                  opacity: tempDetailState.temp / 100,
                                  child: Assets.images.coolGlow2.image(
                                    key: UniqueKey(),
                                    width: 200,
                                  ),
                                )
                              : Opacity(
                                  opacity: tempDetailState.temp / 100,
                                  child: Assets.images.hotGlow4.image(
                                    key: UniqueKey(),
                                    width: 200,
                                  ),
                                )),
                    ),
                    if (state.isShowTyres) ...tyres(constrains),
                    if (state.isShowTyreStatus)
                      GridView.builder(
                        itemCount: 4,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: defaultPadding,
                          crossAxisSpacing: defaultPadding,
                          childAspectRatio:
                              constrains.maxWidth / constrains.maxHeight,
                        ),
                        itemBuilder: (context, index) => TyrePsiCard(
                          isBottomTwoTyre: index > 1,
                          tyrePsi: demoPsiList[index],
                        ),
                      )
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
