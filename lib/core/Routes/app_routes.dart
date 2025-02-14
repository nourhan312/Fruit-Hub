import 'package:flutter/material.dart';
import 'package:fruit_hub/features/Auth/presentation/views/login_screen.dart';

import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

class Routes {
  static const String splashName = '/splash';
  static const String onboardingName = '/onboarding';
  static const String loginName = '/login';
}

class AppRoutes {
  static Route<dynamic> onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashName:
        return MaterialPageRoute(builder: (context) => SplashView());
      case Routes.onboardingName:
        return MaterialPageRoute(builder: (context) => OnboardingView());

      case Routes.loginName:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  backgroundColor: Colors.red,
                ));
    }
  }
}
