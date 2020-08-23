import "package:flutter/material.dart";
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/size_config.dart';


class OTPForm extends StatefulWidget {
  @override
  _OTPFormState createState() => _OTPFormState();
}

class _OTPFormState extends State<OTPForm> {
  FocusNode pin2Node;
  FocusNode pin3Node;
  FocusNode pin4Node;

  @override
  void initState() {
    super.initState();
    pin2Node = FocusNode();
    pin3Node = FocusNode();
    pin4Node = FocusNode();
  }

  @override
  void dispose() {
    pin2Node.dispose();
    pin3Node.dispose();
    pin4Node.dispose();
    super.dispose();
  }

  void nextField({String value, FocusNode nextFocusNode}) {
    if (value.length == 1) {
      nextFocusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildOtpInput(
                autoFocus: true,
                onChanged: (value) {
                  nextField(value: value, nextFocusNode: pin2Node);
                }
              ),
              buildOtpInput(
                focusNode: pin2Node,
                onChanged: (value) {
                  nextField(value: value, nextFocusNode: pin3Node);
                }
              ),
              buildOtpInput(
                focusNode: pin3Node,
                onChanged: (value) {
                  nextField(value: value, nextFocusNode: pin4Node);
                }
              ),
              buildOtpInput(
                focusNode: pin4Node,
                onChanged: (value) {
                  if (value.length == 1) {
                    pin4Node.unfocus();
                  }
                }
              ),
            ]
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          DefaultButton(
            text: "Continue",
            press: () {

            }
          )
        ]
      ),
    );
  }

  SizedBox buildOtpInput({
    bool autoFocus = false,
    Function onChanged,
    FocusNode focusNode
  }) {
    return SizedBox(
      width: getProportionateScreenWidth(60),
      child: TextFormField(
        autofocus: autoFocus,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        obscureText: true,
        onChanged: onChanged,
        style: TextStyle(fontSize: 24),
        textAlign: TextAlign.center,
        decoration: otpInputDecoration
      ),
    );
  }
}