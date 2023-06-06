// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:the_travel_app/misc/colors.dart';
import 'package:the_travel_app/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  final Function() onTap;
  final bool? isResponsive;
  final double? width;
  const ResponsiveButton({
    Key? key,
    required this.onTap,
    this.isResponsive = false,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: width,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.mainColor,
          ),
          child: Row(
              mainAxisAlignment: isResponsive == true
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              children: [
                isResponsive == true
                    ? Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: const AppText(
                          text: 'Приобрести билет',
                          color: Colors.white,
                        ),
                      )
                    : Container(),
                isResponsive == true
                    ? Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: SvgPicture.asset(
                          'img/button_right.svg',
                          // ignore: deprecated_member_use
                          color: Colors.white,
                        ),
                      )
                    : SvgPicture.asset(
                        'img/button_right.svg',
                        // ignore: deprecated_member_use
                        color: Colors.white,
                      )
              ]),
        ),
      ),
    );
  }
}
