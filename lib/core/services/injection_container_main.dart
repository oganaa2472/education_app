
part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _onBoardingInit();
  await _authInit();
}
Future<void> _authInit() async {
// auth

   sl..registerFactory(
      () => AuthBloc(
        signInUsecase: sl(),
        signUpUsecase: sl(),
        forgotPasswordUsecase: sl(),
        updateUserUsecase: sl(),
      ),
    )
    ..registerLazySingleton(
      () => SignInUsecase(sl()),
    )
    ..registerLazySingleton(
      () => SignUpUsecase(sl()),
    )
    ..registerLazySingleton(
      () => UpdateUserUsecase(sl()),
    )
    ..registerLazySingleton(
      () => ForgotPasswordUsecase(sl()),
    )
    ..registerLazySingleton<AuthRepo>(
      () => AuthRepoImpl(sl()),
    )
    ..registerLazySingleton<AuthRemoteDatasource>(
      () => AuthRemoteDataSourcesImpl(
        sl(),
        sl(),
        sl(),
      ),
    )
    ..registerLazySingleton(() => FirebaseAuth.instance)
    ..registerLazySingleton(() => FirebaseFirestore.instance)
    ..registerLazySingleton(() => FirebaseStorage.instance);
}

 Future<void> _onBoardingInit() async {
      final prefs = await SharedPreferences.getInstance();

 
  // Feature --> OnBoardding 

  // Business Logic 

  sl.registerFactory(()
    =>OnBoardingCubit(cacheFirstTimer: sl(), checkingIfUserIsFirstTimer: sl(),),
  );
  // usecases
  sl.registerLazySingleton(()=>CacheFirstTimer(sl()));

  sl.registerLazySingleton(()=>CheckIfUserFirstTimer(sl()));
  // repos 
  sl.registerLazySingleton<OnBoardingRepo>(()=>OnBoardingRepoImpl(sl()));
  // datasources
  sl.registerLazySingleton<OnBoardingLocalDataSource>(()=>OnBoardingLocalDataSrcImp(sl()));
  // shared preferences 
  sl.registerLazySingleton(()=> prefs);
}