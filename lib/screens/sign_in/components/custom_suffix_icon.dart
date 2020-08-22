import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/size_config.dart';

class CustomSuffixIcon extends StatelessWidget {
  const CustomSuffixIcon({
    Key key, @required this.svgIcon,
  }) : super(key: key);
  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenWidth(20)
      ),
      child: SvgPicture.asset(
        svgIcon,
        height: getProportionateScreenHeight(18)
      ),
    );
  }
}