import 'package:flutter/material.dart';
import 'package:loan_form/models/user.dart';
import 'package:loan_form/screens/home/phnum.dart';
import 'package:loan_form/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null)
      return Authenticate();
    else
      return Phnum();
  }
}
