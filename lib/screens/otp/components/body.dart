import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/size_config.dart';
import 'otp_form.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(
                "OTP Verification",
                textAlign: TextAlign.center,
                style: headingStyle
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              Text(
                "We sent your code to +1 480 737 ***",
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("This code will expire in "),
                  TweenAnimationBuilder(
                    tween: Tween(begin: 30.0, end:0), 
                    duration: Duration(seconds: 30), 
                    builder: (context, value, child) {
                      return Text(
                        "00:${value.toInt()}", 
                        style: TextStyle(color: kPrimaryColor)
                      );
                    }
                  )
                ]
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.15),
              OTPForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              GestureDetector(
                onTap: () {
                  //Resend OTP code
                },
                child: Text(
                  "Resend OTP Code",
                  style: TextStyle(
                    decoration: TextDecoration.underline
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

