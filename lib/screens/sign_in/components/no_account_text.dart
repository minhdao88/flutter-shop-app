import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/size_config.dart';


class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?", 
          style: TextStyle(
            fontSize: getProportionateScreenHeight(16)
          )
        ),
        Text(
          " Sign up", 
          style: TextStyle(
            fontSize: getProportionateScreenHeight(16),
            color: kPrimaryColor
          )
        )
      ]
    );
  }
}