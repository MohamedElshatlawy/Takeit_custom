import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/screens/reserve_datails.dart';
import 'package:v_room_app/screens/widgets/custom_text.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';

import 'widgets/custom_appbar.dart';

class Reservations extends StatefulWidget {
  @override
  State<Reservations> createState() => _ReservationsState();
}

class _ReservationsState extends State<Reservations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.current.reservations,
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
                return GestureDetector(
                  onTap: () => Get.to(() => ReserveDetails()),
                  child: _notificationItem(
                    ReservationNo: '1253',
                    ReservationDate: '16-11-2020',
                    ReservationStatus: S.current.waitingStatus,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _notificationItem(
      {String ReservationNo,
      String ReservationDate,
      String ReservationStatus}) {
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
              CustomText(
                text: '# $ReservationNo',
                textColor: ColorsUtils.primaryGreen,
                overflow: TextOverflow.ellipsis,
              ),
              Spacer(),
              CustomText(
                text: ReservationStatus,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          CustomText(
            text: ReservationDate,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
