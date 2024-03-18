import 'package:go_router/go_router.dart';
import 'package:tmor/views/control_view.dart';

import '../views/splash_view.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: '/control',
      builder: (context, state) => const ControlView(),
    ),
  ],
);
