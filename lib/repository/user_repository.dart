import 'dart:convert';

import 'package:v_room_app/models/response/available_dates.dart';
import 'package:v_room_app/models/response/booking_model.dart';
import 'package:v_room_app/models/response/login_model.dart';
import 'package:v_room_app/models/response/map_model.dart';
import 'package:v_room_app/models/response/profile_model.dart';
import 'package:v_room_app/models/response/resturant_model.dart';
import 'package:v_room_app/models/response/user_model.dart';
import 'package:v_room_app/network/networkCallback/NetworkCallback.dart';
import 'package:v_room_app/utils/Enums.dart';

class UserRepository {
  Future<UserModel> registerRequest(
      String name, String phoneNum, String password) async {
    var data = jsonEncode(<String, String>{
      "name": name,
      "login": phoneNum,
      "password": password,
    });
    return UserModel.fromJson(await NetworkCall.makeCall(
      endPoint: 'api/register',
      method: HttpMethod.POST,
      requestBody: data,
    ));
  }

  Future<UserModel> activteRequest(String userPhone, String activateKey) async {
    Map<String, dynamic> data = {
      "userLogin": userPhone,
      "key": activateKey,
    };
    return UserModel.fromJson(await NetworkCall.makeCall(
      endPoint: 'api/activate',
      method: HttpMethod.GET,
      queryParams: data,
    ));
  }

  Future<LoginModel> loginRequest(
      String password, String username, bool rememberMe) async {
    var data = jsonEncode(<String, dynamic>{
      "password": password,
      "rememberMe": rememberMe,
      'username': username
    });
    return LoginModel.fromJson(await NetworkCall.makeCall(
      endPoint: 'api/authenticate',
      method: HttpMethod.POST,
      requestBody: data,
    ));
  }

  Future<ProfileModel> getAccountDetailsRequest() async {
    return ProfileModel.fromJson(await NetworkCall.makeCall(
      endPoint: 'api/account',
      method: HttpMethod.GET,
    ));
  }

  Future<UserModel> changePasswordRequest(
      String currentPassword, String newPassword) async {
    var data = jsonEncode(<String, dynamic>{
      "currentPassword": currentPassword,
      "newPassword": newPassword,
    });
    return UserModel.fromJson(await NetworkCall.makeCall(
      endPoint: 'api/account/change-password',
      method: HttpMethod.POST,
      requestBody: data,
    ));
  }

  Future<UserModel> forgetPasswordRequest(String userPhone) async {
    var data = jsonEncode(<String, dynamic>{
      "login": userPhone,
    });
    return UserModel.fromJson(await NetworkCall.makeCall(
      endPoint: 'api/account/reset-password/init',
      method: HttpMethod.POST,
      requestBody: data,
    ));
  }

  Future<UserModel> resetPasswordRequest(String key, String newPassword) async {
    var data = jsonEncode(<String, dynamic>{
      "key": key,
      "newPassword": newPassword,
    });
    return UserModel.fromJson(await NetworkCall.makeCall(
      endPoint: 'api/account/reset-password/finish',
      method: HttpMethod.POST,
      requestBody: data,
    ));
  }

  Future<MapListModel> getLatLogMap(String latLong) async {
    Map<String, dynamic> data = {
      "latlong": latLong,
    };
    print(await NetworkCall.makeCall(
      endPoint: 'api/restaurants/nearest',
      method: HttpMethod.GET,
      queryParams: data,
    ));
    return MapListModel.fromJson(await NetworkCall.makeCall(
      endPoint: 'api/restaurants/nearest',
      method: HttpMethod.GET,
      queryParams: data,
    ));
  }

  Future<ResturantModel> resturantRequest(String resturantId) async {
    return ResturantModel.fromJson(await NetworkCall.makeCall(
      endPoint: 'api/restaurants/${resturantId}',
      method: HttpMethod.GET,
    ));
  }

  Future<MapListModel> filtterRequest() async {
    return MapListModel.fromJson(await NetworkCall.makeCall(
      endPoint: 'api/cuisines',
      method: HttpMethod.GET,
    ));
  }

  Future<BookingModel> bookingRequest(
      String datePicker, String numberOfGuests) async {
    Map<String, dynamic> data = {
      "date": datePicker,
      "guests": numberOfGuests,
    };
    return BookingModel.fromJson(await NetworkCall.makeCall(
      endPoint: 'api/branch/1/available-slots',
      method: HttpMethod.GET,
      queryParams: data,
    ));
  }

  Future<AvailableDates> availableDatesRequest() async {
    return AvailableDates.fromJson(await NetworkCall.makeCall(
      endPoint: 'api/branch/1/available-dates',
      method: HttpMethod.GET,
    ));
  }
}
