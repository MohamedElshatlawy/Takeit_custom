import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import 'package:v_room_app/App/app_event.dart';
import 'package:v_room_app/App/app_state.dart';
import 'package:v_room_app/models/response/login_model.dart';
import 'package:v_room_app/repository/user_repository.dart';
import 'package:v_room_app/screens/home.dart';
import 'package:v_room_app/utils/TokenUtil.dart';
import 'package:v_room_app/viewModel/locale/localizationProvider.dart';

class LanguageBloc extends Bloc<AppEvent, AppState> {
  LanguageBloc() : super(Start());

  @override
  Future<void> close() {
    return super.close();
  }

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is Click) {
      yield Loading();

      LocalProvider().changeLanguage(Locale('en'));
      yield Done();
    }
  }
}
