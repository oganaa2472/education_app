
import 'package:education_app/core/usecases/usecases.dart';
import 'package:education_app/core/utils/typedef.dart';
import 'package:education_app/src/auth/domain/repos/auth_repo.dart';

class ForgotPasswordUsecase extends UsecaseWithParams<void,String> {
  const ForgotPasswordUsecase(this._repo);
  final AuthRepo _repo;

  @override
  ResultFuture<void> call(String params) => _repo.forgotPassword(params); 
}