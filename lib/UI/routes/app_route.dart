import 'package:auto_route/auto_route.dart';
import 'package:flutter_animation/UI/counter_mvvm/counter.dart';
import 'package:flutter_animation/UI/routes/route_path.dart';
import 'package:flutter_animation/app.dart';

export 'app_route.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: RoutePath.appRouteHome,
      page: AppPage,
      initial: true,
    ),
    AutoRoute(
      path: RoutePath.appRouteCounter,
      page: CounterPage,
    )
  ],
)
class $AppRouter {}
