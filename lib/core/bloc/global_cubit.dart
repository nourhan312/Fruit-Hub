import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/bloc/global_state.dart';
import 'package:fruit_hub/core/services/service_lactor.dart';

import '../database/cache/cache_helper.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());
  // bool isArabic = false;
  String languageCode = 'ar';
  void changeLanguage(String code) async {
    emit(ChangeLanguageLoading());
    // isArabic = !isArabic;
    languageCode = code;
    await sl<CacheHelper>().cacheLanguages(code);
    emit(ChangeLanguageSuccess());
  }

  void getCachedLanguage() async {
    emit(ChangeLanguageLoading());
    final cachedLang = sl<CacheHelper>().getCachedLanguages();
    languageCode = cachedLang;
    emit(ChangeLanguageSuccess());
  }
}
