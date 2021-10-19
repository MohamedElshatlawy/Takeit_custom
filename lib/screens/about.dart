import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_room_app/screens/widgets/custom_appbar.dart';
import 'package:v_room_app/screens/widgets/custom_text.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class About extends StatelessWidget {
  const About({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: CustomAppBar(
            title: 'رجوع',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: CustomText(
                  text: 'سياسه الخصوصيه لتيك ات',
                  fontWeight: FontWeight.bold,
                ),
              ),
              CustomText(
                  text:
                      'سياسه الخصوصيه لتيك ات سياسه الخصوصيه لتصوصيه لتيك ات'),
              CustomText(
                text: '1- النطاق',
                fontWeight: FontWeight.bold,
              ),
              CustomText(
                  text:
                      'سياسه الخصوصيه لتيك ات سياسه الخصوصيه لتصوصيه لتيك ات'),
              CustomText(
                text: '1- النطاق',
                fontWeight: FontWeight.bold,
              ),
              CustomText(
                  text:
                      'سياسه الخصوصيه لتيك ات سياسه الخصوصيه لتصوصيه لتيك ات'),
              CustomText(
                text: '1- النطاق',
                fontWeight: FontWeight.bold,
              ),
              CustomText(
                  text:
                      'سياسه الخصوصيه لتيك ات سياسه الخصوصيه لتصوصيه لتيك ات'),
              CustomText(
                text: '1- النطاق',
                fontWeight: FontWeight.bold,
              ),
              CustomText(
                  text:
                      'سياسه الخصوصيه لتيك ات سياسه الخصوصيه لتصوصيه لتيك ات'),
              CustomText(text: '1- النطاق', fontWeight: FontWeight.bold),
              CustomText(
                  text:
                      'سياسه الخصوصيه لتيك ات سياسه الخصوصيه لتصوصيه لتيك ات'),
              CustomText(
                text: '1- النطاق',
                fontWeight: FontWeight.bold,
              ),
              CustomText(
                  text:
                      'سياسه الخصوصيه لتيك ات سياسه الخصوصيه لتصوصيه لتيك ات'),
            ],
          ),
        ),
      ),
    );
  }
}
