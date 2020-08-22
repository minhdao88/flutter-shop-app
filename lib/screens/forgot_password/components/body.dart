import 'package:flutter/material.dart';
import 'package:shop_app/size_config.dart';
import 'forgot_password_form.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(
                'Forgot Password',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenWidth(24)
                ),
              ),
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
    );
  }
}
