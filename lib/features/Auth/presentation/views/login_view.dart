import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/locale/app_locale.dart';
import 'package:fruit_hub/features/Auth/presentation/cubits/sigin_cubit/signin_cubit.dart';
import 'package:fruit_hub/features/Auth/presentation/widgets/login_body.dart';

import '../../../../core/services/service_lactor.dart';
import '../../../../core/utils/app_textstyles.dart';
import '../../domain/repos/auth_repo.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SigninCubit>(),
      child: Scaffold(
          appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              centerTitle: true,
              title: Text('login'.tr(context), style: TextStyles.bold19)),
          body: LoginBody()),
    );
  }
}
