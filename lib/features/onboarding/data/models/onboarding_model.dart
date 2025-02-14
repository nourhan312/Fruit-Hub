import 'package:flutter/material.dart';
import 'package:fruit_hub/core/locale/app_locale.dart';
import 'package:fruit_hub/core/utils/app_assets.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_textstyles.dart';

class OnboardingModel {
  final String backgroundImage;
  final Widget title;
  final String subTitle;
  final String image;

  OnboardingModel({
    required this.backgroundImage,
    required this.title,
    required this.subTitle,
    required this.image,
  });

  static List<OnboardingModel> getOnboardingPages(BuildContext context) {
    return [
      OnboardingModel(
        backgroundImage: AppAssets.imagesBg1,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'welcomeText'.tr(context),
                style: TextStyles.bold23.copyWith(
                  color: AppColors.black,
                ),
              ),
              TextSpan(
                text: 'fruit'.tr(context),
                style: TextStyles.bold23.copyWith(
                  color: AppColors.green,
                ),
              ),
              TextSpan(
                text: 'hub'.tr(context),
                style: TextStyles.bold23.copyWith(
                  color: AppColors.orange,
                ),
              ),
            ],
          ),
        ),
        subTitle: 'subTitleOne'.tr(context),
        image: AppAssets.imagesFruitbasketAmico,
      ),
      OnboardingModel(
        backgroundImage: AppAssets.imagesBg2,
        title: Text(
          'searchAndMarket'.tr(context),
          style: TextStyles.bold23.copyWith(
            color: AppColors.black,
          ),
        ),
        subTitle: 'subTitleTwo'.tr(context),
        image: AppAssets.imagesPineappleCuate,
      ),
    ];
  }
}
