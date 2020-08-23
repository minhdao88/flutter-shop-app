import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_suffix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/complete_profile/complete_profile_screen.dart';


class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  String confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: 25),
          buildPasswordFormField(
            label: "Password",
            placeholder: "Enter your password",
            onChanged: (value) => password = value
          ),
          SizedBox(height: 25),
          buildPasswordFormField(
            label: "Confirm Password",
            placeholder: "Re-enter your password",
            onChanged: (value) => confirmPassword = value,
            onValidate: (value) {
              if (confirmPassword != password) {
                return "Confirm password doesn't match";
              }
              return null;
            }
          ),
          SizedBox(height: 40),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              }
            }
          )
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField({
    String label, 
    String placeholder, 
    Function onValidate,
    Function onChanged
  }) {
    final int minLength = 8;
    return TextFormField(
      obscureText: true,
      onChanged: (value) {
        onChanged(value);
        _formKey.currentState.validate();
      },
      validator: (value) {
        if (value.isEmpty) {
          return kPassNullError;
        } else if (value.isNotEmpty && value.length < minLength) {
          return kShortPassError;
        }
        if (onValidate != null) {
          return onValidate(value);
        }
        return null;
      },
      decoration: InputDecoration(
          labelText:label,
          hintText: placeholder,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg")
      )
    );
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