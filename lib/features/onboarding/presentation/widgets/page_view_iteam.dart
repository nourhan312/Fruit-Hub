import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/locale/app_locale.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_textstyles.dart';

import '../../../../core/Routes/app_routes.dart';
import '../../../../core/bloc/global_cubit.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.image,
      required this.backgroundImage,
      required this.subTitle,
      required this.title,
      required this.index});

  final String image, backgroundImage, subTitle;
  final Widget title;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  backgroundImage,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  left: 0, right: 0, bottom: 0, child: SvgPicture.asset(image)),
              Positioned(
                top: 10,
                right: 10,
                child: Visibility(
                  visible: index == 0 ? true : false,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Routes.loginName);
                    },
                    child: Text(
                      'skip'.tr(context),
                      style: TextStyles.regular16.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Visibility(
                  visible: index == 0 ? true : false,
                  child: CupertinoSlidingSegmentedControl(
                      children: <int, Widget>{
                        0: Text(
                          'ar'.tr(context),
                          style: TextStyles.regular16.copyWith(
                            color: AppColors.grey,
                          ),
                        ),
                        1: Text(
                          'en'.tr(context),
                          style: TextStyles.regular16.copyWith(
                            color: AppColors.grey,
                          ),
                        ),
                      },
                      onValueChanged: (index) => index == 0
                          ? BlocProvider.of<GlobalCubit>(context)
                              .changeLanguage('ar')
                          : BlocProvider.of<GlobalCubit>(context)
                              .changeLanguage('en')),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.08),
        title,
        SizedBox(height: 24.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: TextStyles.regular16.copyWith(color: AppColors.grey),
          ),
        ),
      ],
    );
  }
}
