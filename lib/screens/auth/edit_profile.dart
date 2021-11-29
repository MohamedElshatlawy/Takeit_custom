import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:v_room_app/App/app_event.dart';
import 'package:v_room_app/App/app_state.dart';
import 'package:v_room_app/Blocs/account_bloc.dart';
import 'package:v_room_app/Blocs/change_password_bloc.dart';
import 'package:v_room_app/Blocs/forget_password_bloc.dart';
import 'package:v_room_app/Blocs/register_bloc.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/models/response/account_model.dart';
import 'package:v_room_app/screens/widgets/custom_rounded_btn.dart';
import 'package:v_room_app/screens/widgets/custom_textfield.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';

class EditProfile extends StatefulWidget {
  final ResponseModel profileInfo;
  EditProfile({this.profileInfo});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtils.appBackground,
      body: Form(
        key: _globalKey,
        child: BlocBuilder<AccountBloc, AppState>(
          builder: (_, state) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Center(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundImage:
                            AssetImage('assets/images/notFoundImage.jpg'),
                      ),
                      SizedBox(height: 60),
                      CustomTextField(
                        onChanged: context.read<AccountBloc>().updateName,
                        controller: TextEditingController(
                            text: widget.profileInfo.name == null
                                ? "Not Found"
                                : widget.profileInfo.name.toString()),
                      ),
                      SizedBox(height: Get.height * 0.03),
                      CustomTextField(
                        onChanged: context.read<AccountBloc>().updateEmail,
                        controller: TextEditingController(
                            text: widget.profileInfo.email == null
                                ? "Not Found"
                                : widget.profileInfo.email.toString()),
                      ),
                      SizedBox(height: Get.height * 0.03),
                      CustomTextField(
                        onChanged: context.read<AccountBloc>().updateActived,
                        controller: TextEditingController(
                            text: widget.profileInfo.activated.toString()),
                      ),
                      SizedBox(height: Get.height * 0.03),
                      CustomTextField(
                        onChanged: context.read<AccountBloc>().updateLanKey,
                        controller: TextEditingController(
                            text: widget.profileInfo.langKey == null
                                ? "Not Found"
                                : widget.profileInfo.langKey.toString()),
                      ),
                      SizedBox(height: Get.height * 0.03),
                      CustomTextField(
                        onChanged: context.read<AccountBloc>().updateCreatedBy,
                        controller: TextEditingController(
                            text: widget.profileInfo.createdBy == null
                                ? "Not Found"
                                : widget.profileInfo.createdBy.toString()),
                      ),
                      SizedBox(height: Get.height * 0.03),
                      CustomTextField(
                        onChanged:
                            context.read<AccountBloc>().updatecreatedDate,
                        controller: TextEditingController(
                            text: widget.profileInfo.createdDate == null
                                ? "Not Found"
                                : widget.profileInfo.createdDate.toString()),
                      ),
                      SizedBox(height: Get.height * 0.03),
                      CustomTextField(
                        onChanged:
                            context.read<AccountBloc>().updateLastModifiedBy,
                        controller: TextEditingController(
                            text: widget.profileInfo.lastModifiedBy == null
                                ? "Not Found"
                                : widget.profileInfo.lastModifiedBy.toString()),
                      ),
                      SizedBox(height: Get.height * 0.03),
                      CustomTextField(
                        onChanged:
                            context.read<AccountBloc>().updateLastModifiedDate,
                        controller: TextEditingController(
                            text: widget.profileInfo.lastModifiedDate == null
                                ? "Not Found"
                                : widget.profileInfo.lastModifiedDate
                                    .toString()),
                      ),
                      SizedBox(height: Get.height * 0.03),
                      CustomTextField(
                        onChanged: context.read<AccountBloc>().updateUserType,
                        controller: TextEditingController(
                            text: widget.profileInfo.userType == null
                                ? "Not Found"
                                : widget.profileInfo.userType.toString()),
                      ),
                      SizedBox(height: Get.height * 0.03),
                      Container(
                        height: 48,
                        child: CustomRoundedButton(
                          load: state is Loading ? true : false,
                          backgroundColor: ColorsUtils.primaryGreen,
                          borderColor: ColorsUtils.primaryGreen,
                          pressed: () {
                            if (_globalKey.currentState.validate()) {
                              context.read<AccountBloc>().add(Edit());
                            } else {
                              return;
                            }
                          },
                          text: 'Edit',
                          textColor: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
