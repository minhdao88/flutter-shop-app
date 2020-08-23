import 'package:flutter/material.dart';
import 'package:shop_app/size_config.dart';
import 'components/body.dart';


class CompleteProfileScreen extends StatelessWidget {
  static String routeName = '/complete_profile';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up")
      ),
      body: Body()
    );
  }
}