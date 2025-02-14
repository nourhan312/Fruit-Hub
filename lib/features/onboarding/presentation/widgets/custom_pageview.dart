import 'package:flutter/material.dart';
import 'package:fruit_hub/features/onboarding/presentation/widgets/page_view_iteam.dart';

import '../../data/models/onboarding_model.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key, required this.controller});
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller,
        itemCount: OnboardingModel.getOnboardingPages(context).length,
        itemBuilder: (context, index) {
          return PageViewItem(
            index: index,
            title: OnboardingModel.getOnboardingPages(context)[index].title,
            backgroundImage: OnboardingModel.getOnboardingPages(context)[index]
                .backgroundImage,
            image: OnboardingModel.getOnboardingPages(context)[index].image,
            subTitle:
                OnboardingModel.getOnboardingPages(context)[index].subTitle,
          );
        });
  }
}
