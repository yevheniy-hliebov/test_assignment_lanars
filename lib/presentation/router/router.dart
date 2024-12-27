import 'package:auto_route/auto_route.dart';
import 'package:test_assignment_lanars/presentation/router/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page, initial: true, path: '/login'),
        AutoRoute(page: MainRoute.page, path: '/main'),
      ];
}
