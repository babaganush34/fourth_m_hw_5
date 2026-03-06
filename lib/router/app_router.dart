import 'package:auto_route/auto_route.dart';
import 'package:fourth_m_hw_5/guard/auth_guard.dart';
import 'package:fourth_m_hw_5/router/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page, Route')
class AppRouter extends RootStackRouter {
  AppRouter({required this.authGuard});

  final AuthGuard authGuard;

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: AuthRoute.page, initial: true, guards: [authGuard]),
    AutoRoute(page: ListTodoRoute.page),
    AutoRoute(page: CreateTodoRoute.page),
    AutoRoute(page: DetailTodoRoute.page),
    AutoRoute(page: SettingsRoute.page),
  ];
}
