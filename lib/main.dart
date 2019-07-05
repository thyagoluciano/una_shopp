import 'package:flutter/material.dart';
import 'package:una_shopp/models/user_model.dart';
import 'package:una_shopp/ui/page/home_page.dart';
import 'package:una_shopp/ui/page/signup_page.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final UserModel userModel = UserModel();
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: userModel,
      child: MaterialApp(
        title: 'Scoped Model Demo',
        home: HomePage()
      ),
    );
  }
}

