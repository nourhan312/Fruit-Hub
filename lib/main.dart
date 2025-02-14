import 'package:flutter/material.dart';
import 'package:fruit_hub/core/Routes/app_routes.dart';

import 'core/locale/app_locale.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
