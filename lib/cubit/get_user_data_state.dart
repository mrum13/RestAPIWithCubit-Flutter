part of 'get_user_data_cubit.dart';

abstract class GetUserDataState extends Equatable {
  const GetUserDataState();

  @override
  List<Object> get props => [];
}

class GetUserDataInitial extends GetUserDataState {}

class GetUserDataLoading extends GetUserDataState {}

class GetUserDataSuccess extends GetUserDataState {
  final UserModel userModel;

  GetUserDataSuccess(this.userModel);

  @override
  List<Object> get props => [userModel];
}

class GetUserDataFailed extends GetUserDataState {
  final String error;

  GetUserDataFailed(this.error);

  @override
  List<Object> get props => [error];
}
