import 'package:RMFlutter/UI/views/home/home_view.dart';
import 'package:RMFlutter/UI/views/startup/startup_view.dart';
import 'package:auto_route/auto_route_annotations.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(
      page: StartupView,
      initial: true,
      name: 'startup',
    ),
    MaterialRoute(
      path: '/home',
      page: HomeView,
      name: 'home',
    ),
  ],
)
class $Router {}
