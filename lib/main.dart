import 'package:flutter/material.dart';
import 'package:fruit_hub/core/Routes/app_routes.dart';

import 'core/database/cache/cache_helper.dart';
import 'core/locale/app_locale.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/services/service_lactor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await sl<CacheHelper>().init();
  runApp(const FruitHub());
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Cairo'),
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
      locale: const Locale('en'),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGeneratedRoute,
      initialRoute: Routes.splashName,
    );
  }
}
