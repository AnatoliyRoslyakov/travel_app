// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:the_travel_app/widgets/app_text.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final String? text;
  final IconData? icon;
  final double size;
  final bool? isIcon;
  final Color backgroundColor;
  final Color borderColor;
  const AppButtons({
    Key? key,
    required this.color,
    this.text = 'Hi',
    this.icon,
    required this.size,
    this.isIcon = false,
    required this.backgroundColor,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1),
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: isIcon == false
          ? Center(
              child: AppText(
                text: text!,
                color: color,
              ),
            )
          : Center(
              child: Icon(
                icon,
                color: color,
              ),
            ),
    );
  }
}
