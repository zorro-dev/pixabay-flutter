import 'dart:io';

import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';


@AutoRouterConfig(
  replaceInRouteName: 'Page|Screen,Route',
)
class AppRouter extends $AppRouter {

  AppRouter({super.navigatorKey});

  @override
  RouteType get defaultRouteType {
    if (Platform.isIOS) {
      return const RouteType.cupertino();
    } else {
      return const RouteType.material();
    }
  }

  @override
  final List<AutoRoute> routes = [
    // Pixabay
    AutoRoute(path: "/", page: DiscoverRoute.page),
    AutoRoute(path: "/", page: PixabayDetailsRoute.page),
    AutoRoute(path: "/", page: PixabaySearchRoute.page),

    // Settings
    AutoRoute(page: SettingsDashboardRoute.page),
    AutoRoute(page: LanguageSettingsRoute.page),
    AutoRoute(page: ThemeSettingsRoute.page),
  ];
}
