import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/sign_up/sign_up_screen.dart';
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
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
          child: Text(
            " Sign up", 
            style: TextStyle(
              fontSize: getProportionateScreenHeight(16),
              color: kPrimaryColor
            )
          ),
        )
      ]
    );
  }
}