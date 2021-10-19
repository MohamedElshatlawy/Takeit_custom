import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_room_app/screens/about.dart';
import 'package:v_room_app/screens/auth/login.dart';
import 'package:v_room_app/screens/contact.dart';
import 'package:v_room_app/screens/order.dart';
import 'package:v_room_app/screens/pay.dart';
import 'package:v_room_app/screens/widgets/CustomListTitle.dart';
import 'package:v_room_app/screens/bottomSheet.dart';
import 'package:v_room_app/screens/widgets/custom_text.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:v_room_app/utils/TokenUtil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
      child: SizedBox(
        height: 800.h,
        width: 230.w,
        child: Drawer(
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
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: ListTile.divideTiles(
                  context: context,
                  tiles: [
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
                        TokenUtil.clearToken();
                        Get.offAll(() => Login());
                      },
                    ),
                    CustomListTitle(
                      title: 'English',
                      dense: true,
                      iconData: null,
                      onTap: () {},
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
    );
  }
}
