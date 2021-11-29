import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import 'package:v_room_app/App/app_event.dart';
import 'package:v_room_app/App/app_state.dart';
import 'package:v_room_app/models/response/account_model.dart';
import 'package:v_room_app/repository/user_repository.dart';
import 'package:v_room_app/screens/home.dart';
import 'package:v_room_app/utils/PreferenceManger.dart';

class AccountBloc extends Bloc<AppEvent, AppState> {
  final _name = BehaviorSubject<String>();
  final _email = BehaviorSubject<String>();
  final _activated = BehaviorSubject<String>();
  final _langKey = BehaviorSubject<String>();
  final _createdBy = BehaviorSubject<String>();
  final _createdDate = BehaviorSubject<String>();
  final _lastModifiedBy = BehaviorSubject<String>();
  final _lastModifiedDate = BehaviorSubject<String>();
  final _userType = BehaviorSubject<String>();

  AccountBloc() : super(Start());
  Function(String) get updateName => _name.sink.add;
  Function(String) get updateEmail => _email.sink.add;
  Function(String) get updateActived => _activated.sink.add;
  Function(String) get updateLanKey => _langKey.sink.add;
  Function(String) get updateCreatedBy => _createdBy.sink.add;
  Function(String) get updatecreatedDate => _createdDate.sink.add;
  Function(String) get updateLastModifiedBy => _lastModifiedBy.sink.add;
  Function(String) get updateLastModifiedDate => _lastModifiedDate.sink.add;
  Function(String) get updateUserType => _userType.sink.add;

  @override
  Future<void> close() {
    _name.close();
    _email.close();
    _activated.close();
    _langKey.close();
    _createdBy.close();
    _createdDate.close();
    _lastModifiedBy.close();
    _lastModifiedDate.close();
    _userType.close();
    return super.close();
  }

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is Click) {
      try {
        yield Loading();
        AccountModel respose = await UserRepository().accountRequest();
        print("ddddddddddddddddddd${respose}");
        if (respose.code == 401) {
          Fluttertoast.showToast(msg: respose.message);
          yield Start();
        } else {
          PreferenceManager.instance.getString('userInfo');
          yield AccountState(accountModel: respose);
        }
      } catch (error) {
        print(error);
      }
    }

    if (event is Edit) {
      try {
        yield Loading();
        // AccountModel respose = await UserRepository().editProfileRequest(
        //     _name.value,
        //     _email.value,
        //     _activated.value,
        //     _langKey.value,
        //     _createdBy.value,
        //     _createdDate.value,
        //     _lastModifiedBy.value,
        //     _lastModifiedDate.value,
        //     _userType.value);
        // print("ddddddddddddddddddd${respose}");
        // if (respose.code == 400) {
        //   Fluttertoast.showToast(msg: respose.message);
        //   yield Start();
        // } else {
        //   Fluttertoast.showToast(msg: "update Done");
        //   yield Done();
        //   Get.to(() => Home());
        // }
        Fluttertoast.showToast(msg: "update Done");
        yield Done();
        Get.to(() => Home());
      } catch (error) {
        print(error);
      }
    }
  }
}
