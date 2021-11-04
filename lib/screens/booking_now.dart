import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:v_room_app/App/app_event.dart';
import 'package:v_room_app/App/app_state.dart';
import 'package:v_room_app/Blocs/booking_bloc.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/screens/widgets/custom_appbar.dart';
import 'package:v_room_app/screens/widgets/custom_rounded_btn.dart';
import 'package:v_room_app/screens/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';

class BookingNowScreen extends StatefulWidget {
  @override
  State<BookingNowScreen> createState() => _BookingNowScreenState();
}

class _BookingNowScreenState extends State<BookingNowScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<BookingBolc>().add(SelectedDate(
        args: DateRangePickerSelectionChangedArgs(DateTime.now())));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: CustomAppBar(
          centerTitle: true,
          title: "Booking",
        ),
        body: BlocBuilder<BookingBolc, AppState>(builder: (_, state) {
          if (state is Loading) {
            return Center(
                child: CircularProgressIndicator(
              color: ColorsUtils.primaryGreen,
            ));
          }
          return Column(
            children: <Widget>[
              SfDateRangePicker(
                onSelectionChanged:
                    (DateRangePickerSelectionChangedArgs args) => context
                        .read<BookingBolc>()
                        .add(SelectedDate(args: args)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomText(
                    text: 'Number Of Gest',
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                    textColor: ColorsUtils.primaryGreen,
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  CircleAvatar(
                    backgroundColor: ColorsUtils.primaryGreen,
                    child: IconButton(
                      onPressed: () =>
                          context.read<BookingBolc>().add(Decrement()),
                      icon: Icon(Icons.remove),
                      color: ColorsUtils.whiteColor,
                    ),
                  ),
                  CustomText(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      text: context.read<BookingBolc>().count.toString()),
                  CircleAvatar(
                    backgroundColor: ColorsUtils.primaryGreen,
                    child: IconButton(
                      onPressed: () =>
                          context.read<BookingBolc>().add(Increment()),
                      icon: Icon(Icons.add),
                      color: ColorsUtils.whiteColor,
                    ),
                  ),
                ],
              )
            ],
          );
        }),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CustomRoundedButton(
            pressed: () {
              context.read<BookingBolc>().add(Click());
            },
            height: 50.h,
            backgroundColor: ColorsUtils.primaryGreen,
            textColor: ColorsUtils.whiteColor,
            load: false,
            text: S.current.booking,
          ),
        ),
      ),
    );
  }
}
