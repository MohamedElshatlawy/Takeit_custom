import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_room_app/App/app_event.dart';
import 'package:v_room_app/App/app_state.dart';
import 'package:v_room_app/models/response/map_model.dart';
import 'package:v_room_app/repository/user_repository.dart';

class FiltterBloc extends Bloc<AppEvent, AppState> {
  FiltterBloc() : super(Start());

  @override
  Future<void> close() {
    return super.close();
  }

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is Click) {
      yield Loading();
      MapListModel res = await UserRepository().filtterRequest();
      // yield Filtter(res);
    }
  }
}
