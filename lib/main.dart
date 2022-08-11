import 'package:flutter/material.dart';
import 'package:tiger/core/app_theme.dart';
import 'package:tiger/core/routes/routes.gr.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 final _appRouter = AppRouter();
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      theme: appTheme,
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate(),
        debugShowCheckedModeBanner: false,
    );
  }


}
