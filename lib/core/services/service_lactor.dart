import 'package:get_it/get_it.dart';

import '../database/cache/cache_helper.dart';

final sl = GetIt.instance;
Future<void> setup() async {
  // register singleton => store object once i created
  // register lazySingleton => store object once i used cachedHelper

  sl.registerLazySingleton<CacheHelper>(() => CacheHelper());
}
