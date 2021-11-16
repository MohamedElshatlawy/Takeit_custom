import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/screens/about.dart';
import 'package:v_room_app/screens/auth/login.dart';
import 'package:v_room_app/screens/bottomSheet.dart';
import 'package:v_room_app/screens/contact.dart';
import 'package:v_room_app/screens/notification.dart';
import 'package:v_room_app/screens/order.dart';
import 'package:v_room_app/screens/pay.dart';
import 'package:v_room_app/screens/reservations.dart';
import 'package:v_room_app/screens/widgets/CustomListTitle.dart';
import 'package:v_room_app/screens/widgets/custom_text.dart';
import 'package:v_room_app/screens/widgets/profile.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:v_room_app/utils/Constants.dart';
import 'package:v_room_app/utils/PreferenceManger.dart';

class CustomDrawer extends StatefulWidget {
  CustomDrawer({
    Key key,
  }) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String language = 'English';

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      // borderRadius: BorderRadius.only(
      //     topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
      child: SizedBox(
        height: 850.h,
        width: 230.w,
        child: Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 130.h,
                  child: DrawerHeader(
                      padding: EdgeInsets.zero,
                      child: Column(
                        children: [
                          CustomText(
                            text: ' مرحبا Sultan',
                            textColor: ColorsUtils.primaryGreen,
                          ),
                          CustomText(
                            text: ' رصيدك هو : 0.0 ريال',
                            textColor: ColorsUtils.primaryGreen,
                          ),
                        ],
                      )),
                ),
                ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.only(bottom: 10),
                  children: ListTile.divideTiles(
                    context: context,
                    tiles: [
                      CustomListTitle(
                        title: S.current.personalAccount,
                        dense: true,
                        iconData: Icons.person,
                        onTap: () {
                          Get.to(() => Profile());
                        },
                      ),
                      CustomListTitle(
                        title: S.current.notification,
                        dense: true,
                        iconData: Icons.notifications,
                        onTap: () {
                          Get.to(() => NotificationScreen());
                        },
                      ),
                      CustomListTitle(
                        title: S.current.reservations,
                        dense: true,
                        iconData: Icons.payment,
                        onTap: () {
                          Get.to(() => Reservations());
                        },
                      ),
                      CustomListTitle(
                        title: 'الدفع',
                        dense: true,
                        iconData: Icons.payment_rounded,
                        onTap: () {
                          Get.to(() => Pay());
                        },
                      ),
                      CustomListTitle(
                        title: 'طلباتي',
                        dense: true,
                        iconData: Icons.payment,
                        onTap: () {
                          Get.to(() => Order());
                        },
                      ),
                      CustomListTitle(
                        title: 'التنبيهات',
                        dense: true,
                        iconData: Icons.payment,
                        onTap: () {
                          modalBottomSheetMenu(context);
                        },
                      ),
                      CustomListTitle(
                        title: 'تواصل معنا',
                        dense: true,
                        iconData: Icons.call_outlined,
                        onTap: () {
                          Get.to(() => Contact());
                        },
                      ),
                      CustomListTitle(
                        title: 'عن تيك ات',
                        dense: true,
                        iconData: Icons.fiber_manual_record_outlined,
                        onTap: () {
                          Get.to(() => About());
                        },
                      ),
                      CustomListTitle(
                        title: 'شروط الاستخدام',
                        dense: true,
                        iconData: Icons.security_rounded,
                      ),
                      CustomListTitle(
                        title: 'شارك تيك ات',
                        dense: true,
                        iconData: null,
                      ),
                      CustomListTitle(
                        title: 'تسحيل الخروج',
                        dense: true,
                        iconData: null,
                        onTap: () {
                          PreferenceManager.getInstance().remove('token');
                          Get.offAll(() => Login());
                        },
                      ),
                      CustomListTitle(
                          title: 'English',
                          dense: true,
                          iconData: null,
                          onTap: () async {
                            var prefs = await SharedPreferences.getInstance();
                            setState(() {
                              prefs.setString(Constants.languageCode, 'en');
                              Restart.restartApp();
                            });
                            print(
                                'aaaaaaaaaaaaaa${prefs.getString(Constants.languageCode)}');
                          }),
                      CustomListTitle(
                        title: 'Arabic',
                        dense: true,
                        iconData: null,
                        onTap: () async {
                          var prefs = await SharedPreferences.getInstance();

                          setState(() {
                            language = 'Arabic';
                            prefs.setString(Constants.languageCode, 'ar');

                            Restart.restartApp();

                            // Get.back();s
                            // print('aaaaaaaaaaaaaa${LocalProvider().appLocal}');
                          });
                          print(
                              'aaaaaaaaaaaaaa${prefs.getString(Constants.languageCode)}');
                        },
                      ),
                      CustomListTitle(
                        title: 'نسخه 3.0.48',
                        dense: true,
                        iconData: null,
                        onTap: () {},
                      ),
                    ],
                  ).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
