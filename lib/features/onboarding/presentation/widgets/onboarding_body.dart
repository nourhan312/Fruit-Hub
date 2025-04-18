import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/Routes/app_routes.dart';
import 'package:fruit_hub/core/locale/app_locale.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_strings.dart';
import 'package:fruit_hub/core/widgets/custom_textbutton.dart';
import 'package:fruit_hub/features/onboarding/presentation/widgets/custom_pageview.dart';

import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/services/service_lactor.dart';

class OnboardingBody extends StatefulWidget {
  const OnboardingBody({super.key});

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  int currentIndex = 0;
  late PageController controller;
  @override
  void initState() {
    controller = PageController();
    controller.addListener(() {
      setState(() {
        currentIndex = controller.page!.round();
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(child: CustomPageView(controller: controller)),
      DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
              color: currentIndex == 1 ? AppColors.green : AppColors.grey,
              activeColor: AppColors.green,
              size: const Size.square(11.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11.0))),
          axis: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.center),
      SizedBox(height: 29),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Visibility(
            visible: currentIndex == 1,
            maintainAnimation: true,
            maintainSize: true,
            maintainState: true,
            child: CustomTextButton(
                onPressed: () async {
                  await sl<CacheHelper>()
                      .saveData(key: AppStrings.onBoardingKey, value: true)
                      .then(((value) => Navigator.pushReplacementNamed(
                          context, Routes.loginName)))
                      .catchError((e) => print(e.toString()));
                },
                data: 'start'.tr(context))),
      ),
      SizedBox(height: 43.h)
    ]);
  }
}
