import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final List<Widget> actions;
  final List<Widget> leading;
  final Widget bottomWidget;
  final bool centerTitle;
  final Color backgroundColor;
  final double leadingWidth;
  CustomAppBar({
    this.title,
    this.leading,
    this.actions,
    this.centerTitle,
    this.backgroundColor,
    this.bottomWidget,
    this.leadingWidth,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      leading: Row(
        children: leading,
      ),
      centerTitle: centerTitle,
      leadingWidth: leadingWidth,
      actions: actions,
      backgroundColor: backgroundColor,
    );
  }
}
