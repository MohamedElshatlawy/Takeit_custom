import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';
import 'package:v_room_app/App/app_event.dart';
import 'package:v_room_app/App/app_state.dart';
import 'package:v_room_app/models/response/available_dates.dart';
import 'package:v_room_app/models/response/booking_model.dart';
import 'package:v_room_app/repository/user_repository.dart';
import 'package:v_room_app/screens/home.dart';
import 'package:v_room_app/screens/widgets/custom_rounded_btn.dart';
import 'package:v_room_app/screens/widgets/custom_text.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingBolc extends Bloc<AppEvent, AppState> {
  String selectedDate = '';
  int count = 1;
  int previousIndex = 0;
  String selectedTime;
  String startDate;
  String endDate;

  BookingBolc() : super(Start());

  @override
  Future<void> close() {
    return super.close();
  }

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is Click) {
      try {
        yield Loading();
        BookingModel response = await UserRepository()
            .bookingRequest(selectedDate, count.toString());
        if (response.responseModel.data.isNotEmpty) {
          Get.dialog(
            StatefulBuilder(
              builder: (BuildContext context,
                  void Function(void Function()) setState) {
                return SimpleDialog(
                  contentPadding: EdgeInsets.all(10.0),
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: response.responseModel.data.length,
                        itemBuilder: (context, index) {
                          // print(
                          //     'ggggggggggggg${response.responseModel.data[index].selectedRadio}');
                          return ExpansionTile(
                              trailing: Checkbox(
                                value: response.responseModel.data[index]
                                        .selectedRadio !=
                                    null,
                                onChanged: null,
                              ),
                              children: List.generate(
                                response.responseModel.data[index]
                                    .availableSlots.length,
                                (i) => RadioListTile(
                                  value: response.responseModel.data[index]
                                      .availableSlots[i],
                                  groupValue: response
                                      .responseModel.data[index].selectedRadio,
                                  onChanged: (newval) {
                                    setState(() {
                                      if (previousIndex != index) {
                                        response
                                            .responseModel
                                            .data[previousIndex]
                                            .selectedRadio = null;
                                        previousIndex = index;
                                      }
                                      response.responseModel.data[index]
                                          .selectedRadio = newval;
                                      selectedTime = response.responseModel
                                          .data[index].selectedRadio;
                                    });
                                  },
                                  title: Text(response.responseModel.data[index]
                                      .availableSlots[i]),
                                ),
                              ).toList(),
                              title: CustomText(
                                text: response
                                    .responseModel.data[index].sectionName
                                    .toString(),
                              ));
                        }),
                    CustomRoundedButton(
                        load: false,
                        text: 'Complete order',
                        backgroundColor: ColorsUtils.primaryGreen,
                        textColor: ColorsUtils.whiteColor,
                        height: 50.h,
                        pressed: () {
                          if (selectedTime != null) {
                            Get.to(() => Home());
                            setState(() {
                              selectedTime = null;
                              count = 1;
                            });
                          } else {
                            Fluttertoast.showToast(msg: 'Please SelectTime');
                          }
                        })
                  ],
                );
              },
            ),
          );
          yield Loaded();
        } else {
          Fluttertoast.showToast(msg: 'Has No data');
        }
      } catch (errorExaption) {
        Fluttertoast.showToast(msg: errorExaption);
        yield Start();
      }
    }
    if (event is SelectedDate) {
      selectedDate =
          DateFormat('dd/MM/yyyy').format(event.args.value).toString();
      AvailableDates response = await UserRepository().availableDatesRequest();
      startDate = response.responseModel.data.first;
      endDate = response.responseModel.data.last;
      yield Loaded();
    }

    if (event is Increment) {
      yield Start();
      count = count + 1;
      yield Loaded();
    }
    if (event is Decrement) {
      yield Start();
      if (count >= 2) {
        count = count - 1;
      }

      yield Loaded();
    }
  }
}
