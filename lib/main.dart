import 'package:flutter/material.dart';
import 'package:loan_form/screens/services/auth.dart';
import 'package:loan_form/screens/wrapper.dart';
import 'package:loan_form/models/user.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(debugShowCheckedModeBanner: false, home: Wrapper()));
  }
}
