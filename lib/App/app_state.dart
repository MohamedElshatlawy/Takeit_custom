import 'package:v_room_app/network/networkCallback/mapper.dart';

abstract class AppState {}

class Done extends AppState {
  Mapper model;
  int id;

  Done({this.model, this.id});
}

class Error extends AppState {}

class Start extends AppState {}

class Loading extends AppState {}

class Empty extends AppState {}
