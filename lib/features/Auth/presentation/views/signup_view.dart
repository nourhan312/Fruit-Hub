import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/locale/app_locale.dart';
import 'package:fruit_hub/features/Auth/presentation/views/signup_view_body.dart';

import '../../../../core/services/service_lactor.dart';
import '../../../../core/utils/app_textstyles.dart';
import '../signup-cubit/signup_cubit.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SignupCubit>(),
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios)),
            centerTitle: true,
            title: Text('signUp'.tr(context), style: TextStyles.bold19)),
        body: SignUpViewBody(),
      ),
    );
  }
}
