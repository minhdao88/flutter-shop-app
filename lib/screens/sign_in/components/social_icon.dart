import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/size_config.dart';


class SocialIcon extends StatelessWidget {
  const SocialIcon({
    Key key, this.icon, this.press,
  }) : super(key: key);
  final String icon;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
        padding: EdgeInsets.all(getProportionateScreenWidth(12)),
        width: getProportionateScreenWidth(40),
        height: getProportionateScreenHeight(40),
        decoration: BoxDecoration(
          color: Color(0XFFF5F6F9),
          shape: BoxShape.circle
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}