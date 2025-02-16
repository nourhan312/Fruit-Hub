import 'package:flutter/material.dart';
import 'package:fruit_hub/core/locale/app_locale.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';

import '../../../../core/utils/app_textstyles.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(10, 0),

      child: Row(
        children: [
          Checkbox(value: true, onChanged: (value) {}, activeColor: AppColors.green),
          SizedBox(
            width: MediaQuery.of(context).size.width - (16 *2) - 54,
            child: RichText(text: TextSpan(
              text: 'fromCreateAccountYouAgree'.tr(context),
              style: TextStyles.regular13.copyWith(
                color: AppColors.lightGrey,
              ),
              children: [
                TextSpan(
                  text: 'conditions'.tr(context),
                  style: TextStyles.regular13.copyWith(
                    color: AppColors.green,
                  ),
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
