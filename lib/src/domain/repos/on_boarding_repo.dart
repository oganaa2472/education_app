
import 'package:education_app/core/utils/typedef.dart';

abstract class OnBoardingRepo {
  const OnBoardingRepo();

  // checked in logged in 
  ResultFuture<void> cacheFirstTimer();
  
  ResultFuture<bool> checkUserIsFirstTimer();
}
