import 'package:flutter/material.dart';
import 'package:tharuncalllogaccessproject/presentation/splash_screen/splash_screen.dart';
import 'package:tharuncalllogaccessproject/presentation/call_log_screen/call_log_widget.dart';
import 'package:tharuncalllogaccessproject/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String callLogScreen = '/call_log_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => SplashScreen(),
    callLogScreen: (context) => CallLogScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
