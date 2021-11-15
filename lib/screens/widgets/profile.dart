import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v_room_app/App/app_state.dart';
import 'package:v_room_app/Blocs/profile_bloc.dart';
import 'package:v_room_app/models/response/login_model.dart';
import 'package:v_room_app/screens/widgets/custom_appbar.dart';
import 'package:v_room_app/screens/widgets/custom_text.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'الملف الشخصي',
        ),
        body: BlocConsumer<ProfileBloc, AppState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is Loading) {
                return Center(child: const CircularProgressIndicator());
              } else if (state is Done) {
                LoginModel userInfo =
                    BlocProvider.of<ProfileBloc>(context).userInfo;
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(
                      color: ColorsUtils.darkGreyTextColor,
                    ),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 25),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: CircleAvatar(
                              maxRadius: 50,
                              backgroundImage:
                                  AssetImage('assets/images/pic1.jpg')),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        _textRow('Name', userInfo.responseModel.name),
                        _dividerWidget(),
                        _textRow('Phone', '512345678'),
                        _dividerWidget(),
                      ],
                    ),
                  ),
                );
              } else {
                return Center(child: Text('Error'));
              }
            }));
  }

  _textRow(String label, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width / 3.5,
              child: CustomText(
                text: label,
                textColor: ColorsUtils.primaryGreen,
              )),
          Expanded(
              child: CustomText(
            text: title,
            textColor: ColorsUtils.primaryGreen,
            overflow: TextOverflow.ellipsis,
          )),
        ],
      ),
    );
  }

  Widget _dividerWidget() {
    return Padding(
        padding: EdgeInsets.only(),
        child: Divider(
          thickness: ScreenUtil().setHeight(1.5),
          color: Colors.grey,
          height: ScreenUtil().setHeight(10),
        ));
  }
}
