import 'package:flutter/material.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/screens/auth/signup.dart';
import 'package:v_room_app/screens/widgets/custom_rounded_btn.dart';
import 'package:v_room_app/screens/widgets/custom_textfield.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';

class Login extends StatelessWidget {
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

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
                  height: 25,
                ),
                Container(
                  height: 48,
                  child: CustomRoundedButton(
                    backgroundColor: ColorsUtils.primaryGreen,
                    borderColor: ColorsUtils.primaryGreen,
                    pressed: () {},
                    text: S.current.login,
                    textColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Text(
                        S.current.forget_password,
                        style: TextStyle(
                            color: ColorsUtils.greyTextColor,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (ctx) => SignUp()));
                  },
                  child: Text(
                    S.current.signup_now,
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: ColorsUtils.greyTextColor),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
