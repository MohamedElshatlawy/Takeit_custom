abstract class AppEvent {}

class Click extends AppEvent {}

class Filter extends AppEvent {
  int data;

  Filter({this.data});
}

class BookingTime extends AppEvent {
  int data;
  String newval;

  BookingTime({this.data, this.newval});
}

class ActivateCode extends AppEvent {}
