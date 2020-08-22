import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/size_config.dart';


class FormErrors extends StatelessWidget {
  const FormErrors({
    Key key,
    @required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        errors.length, 
        (index) => formTextError(error: errors[index])
      )
    );
  }

  Row formTextError({String error}) {
    return Row(
        children: [
          SvgPicture.asset(
            "assets/icons/Error.svg",
            width: getProportionateScreenWidth(14),
            height: getProportionateScreenHeight(14),
          ),
          SizedBox(width: getProportionateScreenWidth(10)),
          Text(error)
        ]
      );
  }
}
