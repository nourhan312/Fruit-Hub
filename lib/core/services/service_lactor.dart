import 'package:fruit_hub/core/bloc/global_cubit.dart';
import 'package:fruit_hub/core/services/database_service.dart';
import 'package:fruit_hub/core/services/firestore_service.dart';
import 'package:fruit_hub/features/Auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

import '../../features/Auth/data/Repos/auth_repo_impl.dart';
import '../../features/Auth/presentation/cubits/sigin_cubit/signin_cubit.dart';
import '../../features/Auth/presentation/cubits/signup-cubit/signup_cubit.dart';
import '../database/cache/cache_helper.dart';
import 'firebase_auth_service.dart';

final sl = GetIt.instance;
Future<void> setup() async {
  //cubit
  sl.registerLazySingleton(() => GlobalCubit());
  // register singleton => store object once i created
  // register lazySingleton => store object once i used cachedHelper

  sl.registerLazySingleton<CacheHelper>(() => CacheHelper());
  sl.registerLazySingleton<FirebaseAuthService>(() => FirebaseAuthService());
  sl.registerLazySingleton<DatabaseService>(() => FireStoreService());
  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      sl<FirebaseAuthService>(),
      sl<DatabaseService>(),
    ),
  );
  sl.registerLazySingleton<SignupCubit>(() => SignupCubit(sl<AuthRepo>()));
  sl.registerLazySingleton<SigninCubit>(() => SigninCubit(sl<AuthRepo>()));
}
