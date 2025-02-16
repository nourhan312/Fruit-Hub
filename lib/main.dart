import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/Routes/app_routes.dart';
import 'package:fruit_hub/core/bloc/global_cubit.dart';
import 'package:fruit_hub/core/bloc/global_state.dart';

import 'core/database/cache/cache_helper.dart';
import 'core/locale/app_locale.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/services/service_lactor.dart';
import 'core/utils/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await sl<CacheHelper>().init();
  runApp(BlocProvider(
      create: (context) => GlobalCubit()..getCachedLanguage(),
      child: const FruitHub()));
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: (const Size(375, 812)),
      builder: (_, child) =>
          BlocBuilder<GlobalCubit, GlobalState>(builder: (context, state) {
        return MaterialApp(
          theme: ThemeData(
              fontFamily: 'Cairo',
              colorScheme: ColorScheme.fromSeed(seedColor: AppColors.white)),
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            AppLocalizations.delegate
          ],
          supportedLocales: [
            const Locale('ar'),
            const Locale('en'),
          ],
          locale: Locale(BlocProvider.of<GlobalCubit>(context).languageCode),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRoutes.onGeneratedRoute,
          initialRoute: Routes.splashName,
        );
      }),
    );
  }
}
