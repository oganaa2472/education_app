import 'package:education_app/core/enums/update_user.dart';
import 'package:education_app/core/usecases/usecases.dart';
import 'package:education_app/core/utils/typedef.dart';
import 'package:education_app/src/auth/domain/repos/auth_repo.dart';
import 'package:equatable/equatable.dart';

class UpdateUserUsecase
    extends UsecaseWithParams<void, UpdateUserParams> {
  UpdateUserUsecase(this._repository);

  final AuthRepo _repository;

  @override
  ResultFuture<void> call(UpdateUserParams params) => _repository.updateUser(
        action: params.action,
        userData: params.userData,
      );
}

class UpdateUserParams extends Equatable {
  const UpdateUserParams({required this.userData, required this.action});

  const UpdateUserParams.empty()
      : this(action: UpdateUserAction.displayName, userData: '');

  final dynamic userData;
  final UpdateUserAction action;

  @override
  List<Object?> get props => [action, userData];
}
