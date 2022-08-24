import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_consume_api/models/user_regist_model.dart';
import 'package:flutter_consume_api/services/post_user_service.dart';

part 'post_user_state.dart';

class PostUserCubit extends Cubit<PostUserState> {
  PostUserCubit() : super(PostUserInitial());

  void signUp({
    required String name,
    required String job,
  }) async {
    try {
      emit(PostUserLoading());

      String responseCode =
          await PostUserService().signUp(name: name, job: job);

      emit(PostUserSuccess(responseCode));
    } catch (e) {
      emit(PostUserFailed(e.toString()));
    }
  }
}
