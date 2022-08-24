part of 'post_user_cubit.dart';

abstract class PostUserState extends Equatable {
  const PostUserState();

  @override
  List<Object> get props => [];
}

class PostUserInitial extends PostUserState {}

class PostUserLoading extends PostUserState {}

class PostUserSuccess extends PostUserState {
  final String responseCode;

  PostUserSuccess(this.responseCode);

  @override
  // TODO: implement props
  List<Object> get props => [responseCode];
}

class PostUserFailed extends PostUserState {
  final String error;

  PostUserFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
