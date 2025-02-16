import 'package:flutter/material.dart';
import 'package:fruit_hub/core/locale/app_locale.dart';
import 'package:fruit_hub/features/Auth/presentation/widgets/login_body.dart';

import '../../../../core/utils/app_textstyles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            }, icon: const Icon(Icons.arrow_back_ios)),
        centerTitle: true,
        title: Text(

          'login'.tr(context),
          style: TextStyles.bold19,
        ),
      ),
      body: SingleChildScrollView(child: SafeArea(child: LoginBody())),
    );
  }
}
