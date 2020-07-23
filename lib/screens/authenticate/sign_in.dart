import 'package:flutter/material.dart';
import 'package:loan_form/screens/home/phnum.dart';
import 'package:loan_form/screens/services/auth.dart';

class SignIn extends StatefulWidget {
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 5.0,
        title: Text('Welcome',
            style: TextStyle(
              fontSize: 30.0,
            )),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 250.0),
            Text(
              'Please fill the loan application form',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 35.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 50.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: ButtonTheme(
                height: 50.0,
                minWidth: 230.0,
                child: RaisedButton(
                    color: Colors.black,
                    splashColor: Colors.yellow,
                    child: Text(
                      'Start',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () async {
                      dynamic result = await _auth.signInAnon();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Phnum()));
                      if (result == null) {
                        print('error signing in');
                      } else {
                        print('signed in');
                        print(result.uid);
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
