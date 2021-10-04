import 'package:flutter/material.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/screens/widgets/custom_rounded_btn.dart';
import 'package:v_room_app/screens/widgets/custom_textfield.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';

class SignUp extends StatelessWidget {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtils.appBackground,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/logo.jpg',
                  scale: 4.5,
                ),
                SizedBox(
                  height: 60,
                ),
                CustomTextField(
                  lablel: S.current.name,
                  controller: nameController,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  lablel: S.current.phone,
                  isMobile: true,
                  isPhoneCode: true,
                  controller: phoneController,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  lablel: S.current.password,
                  hasPassword: true,
                  controller: passwordController,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  lablel: S.current.conf_password,
                  hasPassword: true,
                  controller: confirmPasswordController,
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 48,
                  child: CustomRoundedButton(
                    backgroundColor: ColorsUtils.primaryGreen,
                    borderColor: ColorsUtils.primaryGreen,
                    pressed: () {},
                    text: S.current.signup,
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
      ),
    );
  }
}
