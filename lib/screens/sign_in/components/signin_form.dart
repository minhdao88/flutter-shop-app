import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';
import 'package:shop_app/screens/sign_in/components/custom_suffix_icon.dart';
import 'package:shop_app/screens/sign_in/components/form_error.dart';
import 'package:shop_app/size_config.dart';


class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
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
            Text("Remeber me"),
            Spacer(),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, ForgotPasswordScreen.routeName),
              child: Text( 
                "Forgot password?", 
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
        FormErrors(errors: errors),
        SizedBox(height: getProportionateScreenHeight(20)),
        DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              }
            })
      ]),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
        obscureText: true,
        onChanged: (value) {
          if (value.isNotEmpty && errors.contains(kPassNullError)) {
            setState(() {
              errors.remove(kPassNullError);
            });
          } else if (value.isNotEmpty &&
              value.length > 8 &&
              errors.contains(kShortPassError)) {
            setState(() {
              errors.remove(kShortPassError);
            });
          }
        },
        validator: (value) {
          if (value.isEmpty && !errors.contains(kPassNullError)) {
            setState(() {
              errors.add(kPassNullError);
            });
            return "";
          } else if (value.isNotEmpty &&
              value.length < 8 &&
              !errors.contains(kShortPassError)) {
            setState(() {
              errors.add(kShortPassError);
            });
            return "";
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
          if (value.isNotEmpty && errors.contains(kEmailNullError)) {
            setState(() {
              errors.remove(kEmailNullError);
            });
          } else if (value.isNotEmpty &&
              emailValidatorRegExp.hasMatch(value) &&
              errors.contains(kInvalidEmailError)) {
            setState(() {
              errors.remove(kInvalidEmailError);
            });
          }
        },
        validator: (value) {
          if (value.isEmpty && !errors.contains(kEmailNullError)) {
            setState(() {
              errors.add(kEmailNullError);
            });
            return "";
          } else if (value.isNotEmpty &&
              !emailValidatorRegExp.hasMatch(value) &&
              !errors.contains(kInvalidEmailError)) {
            setState(() {
              errors.add(kInvalidEmailError);
            });
            return "";
          }
          return null;
        },
        decoration: InputDecoration(
            labelText: "Email",
            hintText: "Enter your email",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg")));
  }
}