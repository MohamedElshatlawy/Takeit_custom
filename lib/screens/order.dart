import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_room_app/screens/widgets/custom_appbar.dart';
import 'package:v_room_app/screens/widgets/custom_text.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Order extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: CustomAppBar(
              title: 'طلباتي',
              leading: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                    textDirection: TextDirection.ltr,
                    color: ColorsUtils.whiteColor,
                  ),
                ),
              ],
              backgroundColor: ColorsUtils.primaryGreen,
            ),
            preferredSize: Size.fromHeight(80.h)),
        body: ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          color: ColorsUtils.primaryYellow,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      child: CustomText(text: 'تم التوصيل'),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: ColorsUtils.greyTextColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          )),
                      child: ExpansionTile(
                        tilePadding: EdgeInsets.zero,
                        textColor: Colors.black,
                        trailing: Text(''),
                        subtitle: CustomText(
                          text: '17-3-2020 12-00Am',
                          textAlign: TextAlign.end,
                        ),
                        title: Align(
                            alignment: Alignment.center,
                            child: CustomText(text: 'Title')),
                        children: <Widget>[
                          Container(
                              width: double.infinity,
                              color: Colors.white,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 3,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: CustomText(text: 'title'),
                                      subtitle: CustomText(text: 'subtitle'),
                                      trailing: Column(
                                        children: [
                                          CustomText(
                                            text: '200.0 ريال',
                                            textColor:
                                                ColorsUtils.primaryYellow,
                                          ),
                                          CustomText(
                                            text: 'العدد : 1',
                                            textColor: ColorsUtils.primaryGreen,
                                          ),
                                        ],
                                      ),
                                    );
                                  })),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: 'سعر الطلب : 88.00 ريال',
                                      fontSize: 10,
                                    ),
                                    CustomText(
                                      text: 'الطلب : 587455566',
                                      fontSize: 11,
                                      textColor: ColorsUtils.primaryGreen,
                                    ),
                                  ],
                                ),
                                CustomText(
                                  text: 'التوصيل : 9.00 ريال',
                                  fontSize: 11,
                                ),
                                CustomText(
                                  text: 'المجموع:59.00 ريال',
                                  fontWeight: FontWeight.bold,
                                  textColor: ColorsUtils.primaryGreen,
                                  fontSize: 15,
                                ),
                                CustomText(
                                  text: 'شامل ضريبه 15% - 12.00 ريال',
                                  fontSize: 11,
                                ),
                                CustomText(
                                  text:
                                      'جميع الاسعار شامله ضريبه القيمه المضافه - الرقم الضريبي 5587758888',
                                  fontSize: 11,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}
