import 'package:flutter/material.dart';
import 'package:shop_app/size_config.dart';
import 'package:shop_app/constants.dart';
import 'signin_form.dart';
import 'social_icon.dart';
import 'no_account_text.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding( 
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  'Welcome Back',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(28)),
                ),
                Text(
                  "Sign in with your email and password \n or continue with social",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignInForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialIcon(
                      icon: 'assets/icons/facebook-2.svg',
                      press: () {},
                    ),
                    SocialIcon(
                      icon: 'assets/icons/google-icon.svg',
                      press: () {},
                    ),
                    SocialIcon(
                      icon: 'assets/icons/twitter.svg',
                      press: () {},
                    )
                  ]
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                NoAccountText()
              ],
            ),
          ),
        ),
      ),
    );
  }
}


