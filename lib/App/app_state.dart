import 'package:v_room_app/models/response/map_model.dart';
import 'package:v_room_app/models/response/resturant_model.dart';
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

class Loaded extends AppState {
  MapListModel mapModel;
  Loaded({this.mapModel});
  @override
  List<Object> get props => [mapModel];
}

class Show extends AppState {
  ResturantModel resturantModel;
  Show({this.resturantModel});
}

class Filtter extends AppState {
  List<MapModel> filtterModel;
  Filtter(this.filtterModel);
  @override
  List<Object> get props => [filtterModel];
}

class Empty extends AppState {}
