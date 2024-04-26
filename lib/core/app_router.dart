import 'package:go_router/go_router.dart';

import 'package:shipping_pilot/pages/pages.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginPage(),
      name: LoginPage.name,
    ),
    GoRoute(
      path: '/travel_detail',
      builder: (context, state) => const TravelDetailPage(),
      name: TravelDetailPage.name,
    ),
    GoRoute(
      path: '/visit_detail/:id',
      builder: (context, state) {
        int idx = int.parse(state.pathParameters['id']!);
        return  VisitDetailPage(idx: idx);
      },
      name: VisitDetailPage.name,
    ),
  ],
);