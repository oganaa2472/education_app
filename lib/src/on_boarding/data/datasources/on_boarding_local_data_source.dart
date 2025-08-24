import 'package:education_app/core/errors/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';
abstract class OnBoardingLocalDataSource {
  const OnBoardingLocalDataSource();


  Future<void> cacheFirstTimer();
  Future<bool> checkUserIsFirstTimer();
}
const kFirstTimerKey = 'first_timer';
class OnBoardingLocalDataSrcImp extends OnBoardingLocalDataSource{
  const OnBoardingLocalDataSrcImp(this._prefs);
  final SharedPreferences _prefs;
  @override
  Future<void> cacheFirstTimer()async {
    try{
      await _prefs.setBool(kFirstTimerKey, false);
    }catch(e){
      throw CacheException(message: e.toString());
    } 
  }
  @override
  Future<bool> checkUserIsFirstTimer() async { 
     try{
     return _prefs.getBool(kFirstTimerKey)?? true;
    }catch(e){
      throw CacheException(message: e.toString());
    } 
   
  }
  
}
