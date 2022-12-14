import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiger/core/app_theme.dart';
import 'package:tiger/core/routes/routes.gr.dart';
import 'package:tiger/core/strings/consts.dart';
import 'package:tiger/features/auth/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:tiger/features/auth/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:tiger/features/fortune_wheel/presentation/bloc/ads_and_rate/ads_and_rate_bloc.dart';
import 'core/localizations/app_loaclizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'features/fortune_wheel/presentation/bloc/wheel/wheel_bloc.dart';
import 'injection_container.dart' as di;
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await di.init();
  SharedPreferences sh = di.sl();
  TOKEN = sh.getString('USER_TOKEN');
  invitationCode = sh.getString('INVITATION_CODE');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiBlocProvider(
      providers: [

        BlocProvider(create: (_) => di.sl<LoginBloc>()),
        BlocProvider(create: (_) => di.sl<RegisterBloc>()),
        BlocProvider(create: (context) => di.sl<WheelBlocBloc>()..add(GetUserInfoEvent(token: TOKEN.toString()))
          ..add(GetWheelDataEvent(token: TOKEN.toString())),
        ),
        BlocProvider(create: (_)=>di.sl<AdsAndRateBloc>()..add(InitializeAdsEvent())),



      ],
      child: MaterialApp.router(
        builder: (context,widget)=>ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, widget!,),
            // breakpoints:const [
            //   ResponsiveBreakpoint.autoScale(400,name: MOBILE),
            //   ResponsiveBreakpoint.autoScale(600,name: TABLET),
            //   ResponsiveBreakpoint.autoScale(800,name: DESKTOP),
            //
            // ],
          minWidth: 200,
          maxWidth: 600

        ),

        supportedLocales: const [Locale('en'), Locale('ar')],
        localizationsDelegates: const [
          //  CountryLocalizations.delegate,
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        localeResolutionCallback: (deviceLocale, supportedLocale) {
          for (var locale in supportedLocale) {
            if (deviceLocale != null &&
                deviceLocale.languageCode == locale.languageCode) {
              return deviceLocale;
            }
          }

          return supportedLocale.first;
        },
        theme: appTheme,
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
