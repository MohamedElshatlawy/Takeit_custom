import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_room_app/App/app_event.dart';
import 'package:v_room_app/App/app_state.dart';

class ProfileBloc extends Bloc<AppEvent, AppState> {
  ProfileBloc() : super(Start());

  var userInfo;
  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    print('inside map Event To State ');

    if (event is GetInfo) {
      try {
        print('inside profile bloc');
        yield Loading();
        userInfo = await event.data;
        print('user Info: ${userInfo.responseModel.name}');
        yield Done();
        print('done profile bloc');
      } catch (error) {
        print(error);
      }
    } else {
      print('event:$event');
      print('in else');
    }
  }
}
