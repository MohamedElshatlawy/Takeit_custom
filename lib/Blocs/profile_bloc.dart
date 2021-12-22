import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rxdart/rxdart.dart';
import 'package:v_room_app/App/app_event.dart';
import 'package:v_room_app/App/app_state.dart';
import 'package:v_room_app/models/response/profile_model.dart';
import 'package:v_room_app/models/response/user_model.dart';
import 'package:v_room_app/repository/user_repository.dart';

class ProfileBloc extends Bloc<AppEvent, AppState> {
  final _newPassword = BehaviorSubject<String>();
  final _currentPassword = BehaviorSubject<String>();

  ProfileBloc() : super(Start());

  Function(String) get updateNewPassword => _newPassword.sink.add;
  Function(String) get updateCurrentPassword => _currentPassword.sink.add;

  @override
  Future<void> close() {
    _newPassword.close();
    _currentPassword.close();

    return super.close();
  }

  ProfileModel respose;
  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is Click) {
      try {
        yield Loading();
        respose = await UserRepository().getAccountDetailsRequest();
        print('user Info: ${respose.name}');
        yield Done();
      } catch (error) {
        print(error);
      }
    }
    if (event is ResetPass) {
      if (_currentPassword.value == _newPassword.value) {
        Fluttertoast.showToast(msg: 'من فضلك ادخل كلمة مرور جديده');
      } else {
        try {
          yield Loading();
          UserModel response = await UserRepository().changePasswordRequest(
              _currentPassword.value, _newPassword.value);
          print('response:${response.message}');
          yield Done();
          // Fluttertoast.showToast(msg: 'تم تغير كلمه المرور بنجاح');
        } catch (error) {
          print(error);
        }
      }
    }
  }
}
