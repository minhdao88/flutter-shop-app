import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_suffix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';
import 'package:shop_app/size_config.dart';


class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool remember = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        buildEmailFormField(),
        SizedBox(height: getProportionateScreenHeight(20)),
        buildPasswordFormField(),
        SizedBox(height: getProportionateScreenHeight(10)),
        Row(
          children: [
            Checkbox(
              value: remember, 
              activeColor: kPrimaryColor,
              onChanged: (value) {
                setState(() {
                  remember = value;
                });
              },
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  remember = !remember;
                });
              },
              child: Text("Remeber me")
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
                _formKey.currentState.reset();
              },
              child: Text( 
                "Forgot password?", 
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
        DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                _formKey.currentState.reset();
                remember = false;
              }
            })
      ]),
    );
  }

  TextFormField buildPasswordFormField() {
    final int minLength = 8;
    return TextFormField(
        obscureText: true,
        onChanged: (value) {
          _formKey.currentState.validate();
        },
        validator: (value) {
          if (value.isEmpty) {
            return kPassNullError;
          } else if (value.isNotEmpty && value.length < minLength) {
            return kShortPassError;
          }
          return null;
        },
        decoration: InputDecoration(
            labelText: "Password",
            hintText: "Enter your password",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg")));
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        _formKey.currentState.validate();
      },
      validator: (value) {
        if (value.isEmpty) {
          return kEmailNullError;
        } else if (value.isNotEmpty && !emailValidatorRegExp.hasMatch(value)) {
          return kInvalidEmailError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg")
      )
    );
  }
}