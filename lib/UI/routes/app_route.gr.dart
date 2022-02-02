// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:flutter_animation/initial_page.dart' as _i1;
import 'package:flutter_animation/UI/counter_mvvm/counter.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    InitialRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.InitialPage());
    },
    CounterRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.CounterPage());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(InitialRoute.name, path: '/'),
        _i3.RouteConfig(CounterRoute.name, path: '/counter')
      ];
}

/// generated route for
/// [_i1.InitialPage]
class InitialRoute extends _i3.PageRouteInfo<void> {
  const InitialRoute() : super(InitialRoute.name, path: '/');

  static const String name = 'InitialRoute';
}

/// generated route for
/// [_i2.CounterPage]
class CounterRoute extends _i3.PageRouteInfo<void> {
  const CounterRoute() : super(CounterRoute.name, path: '/counter');

  static const String name = 'CounterRoute';
}
