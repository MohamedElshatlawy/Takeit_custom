abstract class AppEvent {}

class Click extends AppEvent {}

class Filter extends AppEvent {
  int data;

  Filter({this.data});
}

class ActivateCode extends AppEvent {}
