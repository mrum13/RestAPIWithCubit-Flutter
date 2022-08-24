import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_consume_api/models/user_model.dart';
import 'package:flutter_consume_api/services/get_single_user_service.dart';

part 'get_user_data_state.dart';

class GetUserDataCubit extends Cubit<GetUserDataState> {
  GetUserDataCubit() : super(GetUserDataInitial());

  void getUserData() async {
    try {
      emit(GetUserDataLoading());
      UserModel userModel = await GetSingleUserService().getUser();
      emit(GetUserDataSuccess(userModel));
    } catch (e) {
      emit(GetUserDataFailed(e.toString()));
    }
  }
}
