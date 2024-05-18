import 'package:go_router/go_router.dart';

import 'package:shipping_pilot/pages/index.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      builder: (context, state) => const LoginPage(),
      name: LoginPage.name,
      path: '/',
    ),
    GoRoute(
      builder: (context, state) => const EditProfilePage(),
      name: EditProfilePage.name,
      path: '/edit_profile',
    ),
    GoRoute(
      builder: (context, state) {
        String id = state.pathParameters['id']!;
        return TravelDetailPage(travelId: id);
      },
      name: TravelDetailPage.name,
      path: '/travel_detail/:id',
    ),
    GoRoute(
      builder: (context, state) => const TravelListPage(),
      name: TravelListPage.name,
      path: '/travel_list',
    ),
    GoRoute(
      builder: (context, state) {
        String id = state.pathParameters['id']!;
        String? travelId = state.uri.queryParameters['travelId'];
        
        return  VisitDetailPage(travelId: travelId, visitId: id);
      },
      name: VisitDetailPage.name,
      path: '/visit_detail/:id',
    ),
    GoRoute(
      builder: (context, state) {
        String id = state.pathParameters['id']!;
        String? travelId = state.uri.queryParameters['travelId'];

        return VisitFinalizePage(travelId: travelId, visitId: id);
      },
      name: VisitFinalizePage.name,
      path: '/visit_detail/:id/finalize',
    ),
  ],
);