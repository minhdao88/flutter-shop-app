import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/components/custom_suffix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/otp/otp_screen.dart';


class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  String firstName;
  String lastName;
  String phoneNumber;
  String address;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: (
        Column(
          children: [
            buildFirstNameFormField(),
            SizedBox(height: 25),
            buildLastNameFormField(),
            SizedBox(height: 25),
            buildPhoneNumberFormField(),
            SizedBox(height: 25),
            buildAddressFormField(),
            SizedBox(height: 40),
            DefaultButton(
              text: "Continue",
              press: () {
                if (_formKey.currentState.validate()) {
                  Navigator.pushNamed(context, OTPScreen.routeName);
                }
              }
            ),
            SizedBox(height: 40),
            Text(
              "By continuing you confirm that you agree \nwith our Term and Conditions",
              textAlign: TextAlign.center
            ),
          ]
        )
      )
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        _formKey.currentState.validate();
      },
      validator: (value) {
        if (value.isEmpty) {
          return kAddressNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Address",
        hintText: "Enter your address",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Location point.svg")
      )
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        _formKey.currentState.validate();
      },
      validator: (value) {
        if (value.isEmpty) {
          return kPhonenumberNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone number",
        hintText: "Enter your phone number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Phone.svg")
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      onSaved: (newValue) => lastName = newValue,
      onChanged: (value) {
        _formKey.currentState.validate();
      },
      validator: (value) {
        if (value.isEmpty) {
          return kLastNameNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Last name",
        hintText: "Enter your last name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/User Icon.svg")
      )
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        _formKey.currentState.validate();
      },
      validator: (value) {
        if (value.isEmpty) {
          return kFirstNameNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "First name",
        hintText: "Enter your first name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/User Icon.svg")
      )
    );
  }
}