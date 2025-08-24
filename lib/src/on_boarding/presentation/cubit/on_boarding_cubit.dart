

import 'package:education_app/src/on_boarding/domain/usecases/cache_first_timer.dart';
import 'package:education_app/src/on_boarding/domain/usecases/check_if_user_first_timer.dart';
import 'package:education_app/src/on_boarding/presentation/cubit/on_boarding_state.dart';
import 'package:bloc/bloc.dart';
class OnBoardingCubit extends Cubit<OnBoardingState>{
  OnBoardingCubit({
    required CacheFirstTimer cacheFirstTimer,
    required CheckIfUserFirstTimer checkingIfUserIsFirstTimer
  }):_cacheFirstTimer = cacheFirstTimer,
  _checkIfUserIsFirstTimer = checkingIfUserIsFirstTimer,
  super(const OnBoardingInitial());

  final CacheFirstTimer _cacheFirstTimer;
  final CheckIfUserFirstTimer _checkIfUserIsFirstTimer;

  Future<void> cacheFirstTimer() async {
    final result = await _cacheFirstTimer();
    result.fold((failure)=> emit(OnBoardingError(failure.message)), (_)=> emit(const UserCached()));
  }

  Future<void> checkingIfUserIsFirstTimer() async {
    final result = await _checkIfUserIsFirstTimer();

    result.fold((l) => emit(OnBoardingStatus(isFirstTimer: true)),(status)=>emit(OnBoardingStatus(isFirstTimer: status)));
  }
}