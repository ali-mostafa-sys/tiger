



import 'package:auto_route/auto_route.dart';
import 'package:tiger/features/auth/presentation/pages/login_screen/login_screen.dart';
import 'package:tiger/features/auth/presentation/pages/register_screen/register_screen.dart';
import 'package:tiger/features/launcher/launcher_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: '/',
      page: LauncherScreen,

      initial: true
    ),
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
