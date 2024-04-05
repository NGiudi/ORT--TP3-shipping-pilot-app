import 'package:go_router/go_router.dart';

import 'package:shipping_pilot/pages/session/login_page.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginPage(),
      name: LoginPage.name,
    ),
  ],
);