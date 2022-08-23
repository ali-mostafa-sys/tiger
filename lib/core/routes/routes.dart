import 'package:auto_route/auto_route.dart';
import 'package:tiger/features/auth/presentation/pages/login_screen/login_screen.dart';
import 'package:tiger/features/auth/presentation/pages/register_screen/register_screen.dart';
import 'package:tiger/features/auth/presentation/pages/launcher_screen.dart';

import '../../features/fortune_wheel/presentation/pages/wheel_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    // AutoRoute(path: '/', page: LauncherScreen, initial: false),
    
    AutoRoute(
      path: '/login',
      page: LoginScreen,
      name: 'LoginRoute',
    ),
    AutoRoute(
      path: '/register',
      page: RegisterScreen,
      name: 'RegisterRoute',
    ),
    AutoRoute(
        path: '/homePage',
        name: 'homePageRoute',
        page: WheelPage,
        initial: true
        ),
  ],
)
class $AppRouter {}

// CustomRoute(
// path: '/',
// page: LauncherScreen,
// initial: true,
// ),
// CustomRoute(
// page: LoginScreen,
// // name: 'login',
// path: '/login',
// ),
// CustomRoute(
// page: RegisterScreen,
// // name: 'register',
// path: '/register',
// ),
