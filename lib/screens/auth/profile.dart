import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_room_app/App/app_event.dart';
import 'package:v_room_app/App/app_state.dart';
import 'package:v_room_app/Blocs/profile_bloc.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/models/response/profile_model.dart';
import 'package:v_room_app/screens/widgets/custom_appbar.dart';
import 'package:v_room_app/screens/widgets/custom_textfield.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';

import '../widgets/custom_rounded_btn.dart';

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
    context.read<ProfileBloc>().add(Click());
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
                ProfileModel userInfo = context.read<ProfileBloc>().respose;
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
                          initialValue: userInfo.name,
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
                          lablel: S.current.currentPassword,
                          validator: (String v) {
                            if (v.length < 6) {
                              return S.current.enterThePassCorrectly;
                            }
                          },
                          hasPassword: true,
                          initialValue: 'XXXXXX',
                          readOnly: edit,
                          onChanged:
                              context.read<ProfileBloc>().updateCurrentPassword,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          lablel: S.current.newPassword,
                          validator: (String v) {
                            if (v.length < 6) {
                              return S.current.enterThePassCorrectly;
                            }
                          },
                          hasPassword: true,
                          initialValue: 'XXXXXX',
                          readOnly: edit,
                          onChanged:
                              context.read<ProfileBloc>().updateNewPassword,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          height: 48,
                          child: CustomRoundedButton(
                            load: state is Loading ? true : false,
                            backgroundColor: ColorsUtils.primaryGreen,
                            borderColor: ColorsUtils.primaryGreen,
                            pressed: edit == true
                                // || state is Done
                                ? () {
                                    setState(() {
                                      edit = false;
                                    });
                                  }
                                : () async {
                                    if (_globalKey.currentState.validate()) {
                                      await context
                                          .read<ProfileBloc>()
                                          .add(ResetPass());
                                    } else {
                                      print('error in validator');
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
