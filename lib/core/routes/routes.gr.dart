// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../../features/auth/presentation/pages/login_screen/login_screen.dart'
    as _i2;
import '../../features/auth/presentation/pages/register_screen/register_screen.dart'
    as _i3;
import '../../features/auth/presentation/pages/launcher_screen.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    LauncherScreen.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LauncherScreen());
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.LoginScreen(key: args.key));
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>(
          orElse: () => const RegisterRouteArgs());
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.RegisterScreen(key: args.key));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(LauncherScreen.name, path: '/'),
        _i4.RouteConfig(LoginRoute.name, path: '/login'),
        _i4.RouteConfig(RegisterRoute.name, path: '/register')
      ];
}

/// generated route for
/// [_i1.LauncherScreen]
class LauncherScreen extends _i4.PageRouteInfo<void> {
  const LauncherScreen() : super(LauncherScreen.name, path: '/');

  static const String name = 'LauncherScreen';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginRoute extends _i4.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i5.Key? key})
      : super(LoginRoute.name, path: '/login', args: LoginRouteArgs(key: key));

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.RegisterScreen]
class RegisterRoute extends _i4.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({_i5.Key? key})
      : super(RegisterRoute.name,
            path: '/register', args: RegisterRouteArgs(key: key));

  static const String name = 'RegisterRoute';
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key}';
  }
}
