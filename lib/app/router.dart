import 'package:RMFlutter/UI/views/home/home_view.dart';
import 'package:RMFlutter/UI/views/sign_in/sign_in_view.dart';
import 'package:auto_route/auto_route_annotations.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(
      path: '/',
      page: SignInView,
      initial: true,
    ),
    MaterialRoute(
      path: '/home',
      page: HomeView,
    ),
  ],
)
class $Router {}
