import 'package:flutter/material.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';

class CustomListTitle extends StatelessWidget {
  final String title;
  final bool dense;
  final Function onTap;
  final IconData iconData;
  CustomListTitle({
    Key key,
    this.title,
    this.dense,
    this.onTap,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: ColorsUtils.primaryGreen),
      ),
      dense: dense,
      leading: Icon(
        iconData,
        color: ColorsUtils.primaryGreen,
      ),
      onTap: onTap ?? () {},
    );
  }
}
