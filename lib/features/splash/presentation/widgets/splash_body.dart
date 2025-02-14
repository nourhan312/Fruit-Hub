import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_assets.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: SvgPicture.asset(AppAssets.imagesFreepikPlantInject63),
        ),
        SvgPicture.asset(AppAssets.imagesLogo),
        SvgPicture.asset(AppAssets.imagesFreepikCirclesInject5),
      ],
    );
  }
}
