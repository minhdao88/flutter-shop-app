import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/size_config.dart';
import 'forgot_password_form.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  'Forgot Password',
                  style: headingStyle,
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                Text(
                  "Please enter an email and we will send \nyou a link for reset password instruction",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                ForgotPasswordForm()
              ]
            ),
          ),
        ),
      ),
    );
  }
}
