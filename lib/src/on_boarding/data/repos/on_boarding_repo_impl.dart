import 'package:dartz/dartz.dart';
import 'package:education_app/core/errors/exceptions.dart';
import 'package:education_app/core/errors/failures.dart';
import 'package:education_app/core/utils/typedef.dart';
import 'package:education_app/src/on_boarding/data/datasources/on_boarding_local_data_source.dart';
import 'package:education_app/src/on_boarding/domain/repos/on_boarding_repo.dart';

class OnBoardingRepoImpl implements OnBoardingRepo{
  const OnBoardingRepoImpl(this._localDataSource);
  final OnBoardingLocalDataSource _localDataSource;

  @override
  ResultFuture<void> cacheFirstTimer() async{
    // TODO: implement cacheFirstTimer
    try{
      await _localDataSource.cacheFirstTimer();
      return Right(null);
    }on CacheException catch(e){
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  
  }


  @override
  ResultFuture<bool> checkUserIsFirstTimer()  async{
    // TODO: implement checkUserIsFirstTimer
   try {
      final result = await _localDataSource.checkUserIsFirstTimer();
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }

}