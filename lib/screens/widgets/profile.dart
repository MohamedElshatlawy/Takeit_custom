import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_room_app/App/app_event.dart';
import 'package:v_room_app/App/app_state.dart';
import 'package:v_room_app/Blocs/login_bloc.dart';
import 'package:v_room_app/Blocs/profile_bloc.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/screens/widgets/custom_appbar.dart';
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
  void initState() {
    // TODO: implement initState
    // var login =
    //     PreferenceManager.getInstance().getString('registerResponseLogin');
    // login != null
    //     ? context
    //         .read<ProfileBloc>()
    //         .add(GetInfo(data: context.read<RegisterBloc>().response))
    //     :
    context
        .read<ProfileBloc>()
        .add(GetInfo(data: context.read<LoginBloc>().respose));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: S.current.personalAccount,
        ),
        body: BlocConsumer<ProfileBloc, AppState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is Loading) {
                return Center(child: const CircularProgressIndicator());
              } else if (state is Done) {
                var userInfo = context.read<ProfileBloc>().userInfo;
                return Form(
                  key: _globalKey,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 30),
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
                          initialValue: userInfo.responseModel.name,
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
                            text:
                                edit == true ? S.current.edit : S.current.save,
                            textColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Center(child: Text('Error'));
              }
            }));
  }
}
