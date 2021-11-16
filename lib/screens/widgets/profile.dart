import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/screens/widgets/custom_appbar.dart';
import 'package:v_room_app/screens/widgets/custom_text.dart';
import 'package:v_room_app/screens/widgets/custom_textfield.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';

import 'custom_rounded_btn.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  bool edit = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.current.personalAccount,
      ),
      body: Form(
        key: _globalKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
          child: Column(
            children: [
              CustomTextField(
                validator: (String v) {
                  if (v.isEmpty) {
                    return S.current.enterTheName;
                  }
                },
                lablel: S.current.firstName,
                // onChanged: context.read<ProfileBloc>().updateName,
                initialValue: S.current.userName,
                readOnly: edit,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                validator: (String v) {
                  if (v.length < 6) {
                    return S.current.enterThePhoneNo;
                  }
                },
                lablel: S.current.phone,
                isMobile: true,
                isPhoneCode: true,
                initialValue: '512345678',
                readOnly: edit,
                // onChanged: context.read<ProfileBloc>().updatePhone,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                lablel: S.current.password,
                validator: (String v) {
                  if (v.length < 6) {
                    return S.current.enterThePassCorrectly;
                  }
                },
                hasPassword: true,
                initialValue: '123456789',
                readOnly: edit,
                // onChanged: context.read<ProfileBloc>().updatePassword,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                lablel: S.current.conf_password,
                validator: (String v) {
                  if (v.length < 6) {
                    return S.current.enterThePassCorrectly;
                  }
                },
                hasPassword: true,
                initialValue: '123456789',
                readOnly: edit,
                // onChanged: context.read<ProfileBloc>().updateConfirm,
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 48,
                child: CustomRoundedButton(
                  load: false,
                  backgroundColor: ColorsUtils.primaryGreen,
                  borderColor: ColorsUtils.primaryGreen,
                  pressed: edit == true
                      ? () {
                          setState(() {
                            edit = false;
                          });
                        }
                      : () {
                          if (_globalKey.currentState.validate()) {
                          } else {
                            return;
                          }
                        },
                  text: edit == true ? S.current.edit : S.current.save,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),

      // BlocConsumer<ProfileBloc, AppState>(
      //     listener: (context, state) {},
      //     builder: (context, state) {
      //       if (state is Loading) {
      //         return Center(child: const CircularProgressIndicator());
      //       } else if (state is Done) {
      //         LoginModel userInfo =
      //             BlocProvider.of<ProfileBloc>(context).userInfo;
      //         return Card(
      //           margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      //           shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(10.0),
      //             side: BorderSide(
      //               color: ColorsUtils.darkGreyTextColor,
      //             ),
      //           ),
      //           elevation: 5,
      //           child: Padding(
      //             padding: const EdgeInsets.symmetric(
      //                 horizontal: 35, vertical: 25),
      //             child: Column(
      //               children: [
      //                 Align(
      //                   alignment: Alignment.center,
      //                   child: CircleAvatar(
      //                       maxRadius: 50,
      //                       backgroundImage:
      //                           AssetImage('assets/images/pic1.jpg')),
      //                 ),
      //                 SizedBox(
      //                   height: 30.h,
      //                 ),
      //                 _textRow('Name', userInfo.responseModel.name),
      //                 _dividerWidget(),
      //                 _textRow('Phone', '512345678'),
      //                 _dividerWidget(),
      //               ],
      //             ),
      //           ),
      //         );
      //       } else {
      //         return Center(child: Text('Error'));
      //       }
      //     })
    );
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
