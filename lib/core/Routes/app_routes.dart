import 'package:flutter/material.dart';
import 'package:fruit_hub/features/Auth/presentation/views/forget_password.dart';
import 'package:fruit_hub/features/Auth/presentation/views/login_view.dart';
import 'package:fruit_hub/features/Auth/presentation/views/new_password.dart';
import 'package:fruit_hub/features/Auth/presentation/views/password_recovery.dart';

import '../../features/Auth/presentation/views/signup_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

class Routes {
  static const String splashName = '/splash';
  static const String onboardingName = '/onboarding';
  static const String loginName = '/login';
  static const String signUpRoute = '/signUp';
  static const String forgetPassword = '/forgetPassword';
  static const String recoveryPassword = '/recoveryPassword';
  static const String newPassword = '/newPassword';

  static const String homeName = '/home';
  static const String profileName = '/profile';
  static const String settingsName = '/settings';
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

      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (context) => SignupView());
      case Routes.forgetPassword:
        return MaterialPageRoute(builder: (context) => ForgetPassword());

      case Routes.recoveryPassword:
        return MaterialPageRoute(builder: (context) => PasswordRecovery());

      case Routes.newPassword:
        return MaterialPageRoute(builder: (context) => NewPassword());
      case Routes.homeName:
        return MaterialPageRoute(builder: (context) => const HomeView());

      default:
        return MaterialPageRoute(builder: (context) => NewPassword());
    }
  }
}
