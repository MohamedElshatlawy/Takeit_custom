import 'package:flutter/material.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/screens/widgets/custom_text.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';

import 'widgets/custom_appbar.dart';

class NotificationScreen extends StatefulWidget {
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.current.notification,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 35),
              itemCount: 5,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10,
                );
              },
              itemBuilder: (context, index) {
                return _notificationItem(
                  title: S.current.restaurantName,
                  subTitle: S.current.bookingAccepted,
                  date: S.current.now,
                );
              },
            ),
          )
        ],
      ),
    );
  }

  _notificationItem({String title, String subTitle, String date}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      height: 80,
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                color: ColorsUtils.primaryGreen,
                child: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              CustomText(
                text: title,
                textColor: ColorsUtils.primaryGreen,
                overflow: TextOverflow.ellipsis,
              ),
              Spacer(),
              CustomText(
                text: date,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          CustomText(
            text: subTitle,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
