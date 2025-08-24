import 'package:education_app/src/on_boarding/data/datasources/on_boarding_local_data_source.dart';
import 'package:education_app/src/on_boarding/data/repos/on_boarding_repo_impl.dart';
import 'package:education_app/src/on_boarding/domain/repos/on_boarding_repo.dart';
import 'package:education_app/src/on_boarding/domain/usecases/cache_first_timer.dart';
import 'package:education_app/src/on_boarding/domain/usecases/check_if_user_first_timer.dart';
import 'package:education_app/src/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {

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