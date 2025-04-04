import 'package:flutter/material.dart';
import 'package:fruit_hub/core/database/cache/cache_helper.dart';
import 'package:fruit_hub/core/utils/app_strings.dart';
import 'package:fruit_hub/features/splash/presentation/widgets/splash_body.dart';

import '../../../../core/Routes/app_routes.dart';
import '../../../../core/services/service_lactor.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    bool isVisited =
        sl<CacheHelper>().getData(key: AppStrings.onBoardingKey) ?? false;
    Future.delayed(
        Duration(seconds: 4),
        () => isVisited
            ? Navigator.pushReplacementNamed(context, Routes.loginName)
            : Navigator.pushReplacementNamed(context, Routes.onboardingName));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashBody(),
    );
  }
}

// Doneeee
