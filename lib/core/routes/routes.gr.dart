// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../../features/auth/presentation/pages/launcher_screen.dart' as _i1;
import '../../features/auth/presentation/pages/login_screen/login_screen.dart'
    as _i2;
import '../../features/auth/presentation/pages/register_screen/register_screen.dart'
    as _i3;
import '../../features/fortune_wheel/presentation/pages/profile_page.dart'
    as _i5;
import '../../features/fortune_wheel/presentation/pages/wheel_page.dart' as _i4;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    LauncherScreen.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LauncherScreen());
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.LoginScreen(key: args.key));
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>(
          orElse: () => const RegisterRouteArgs());
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.RegisterScreen(key: args.key));
    },
    HomePageRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.WheelPage());
    },
    ProfileRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.ProfilePage());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(LauncherScreen.name, path: '/'),
        _i6.RouteConfig(LoginRoute.name, path: '/login'),
        _i6.RouteConfig(RegisterRoute.name, path: '/register'),
        _i6.RouteConfig(HomePageRoute.name, path: '/homePage'),
        _i6.RouteConfig(ProfileRoute.name, path: '/profile')
      ];
}

/// generated route for
/// [_i1.LauncherScreen]
class LauncherScreen extends _i6.PageRouteInfo<void> {
  const LauncherScreen() : super(LauncherScreen.name, path: '/');

  static const String name = 'LauncherScreen';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginRoute extends _i6.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i7.Key? key})
      : super(LoginRoute.name, path: '/login', args: LoginRouteArgs(key: key));

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.RegisterScreen]
class RegisterRoute extends _i6.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({_i7.Key? key})
      : super(RegisterRoute.name,
            path: '/register', args: RegisterRouteArgs(key: key));

  static const String name = 'RegisterRoute';
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.WheelPage]
class HomePageRoute extends _i6.PageRouteInfo<void> {
  const HomePageRoute() : super(HomePageRoute.name, path: '/homePage');

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [_i5.ProfilePage]
class ProfileRoute extends _i6.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: '/profile');

  static const String name = 'ProfileRoute';
}
