import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:loan_form/screens/home/loan.dart';
import 'datamodel.dart';

// ignore: must_be_immutable
class Address extends StatefulWidget {
  DataModel data;
  Address({this.data});
  _AddressState createState() => _AddressState(data: data);
}

class _AddressState extends State<Address> {
  var formkey = GlobalKey<FormState>();
  var emailaddr;
  var permaddr;
  var curraddr;
  DataModel data;
  _AddressState({this.data});
  @override
  Widget build(BuildContext context) {
    String error = 'Please fill this in';
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 5.0,
        title: Text('Enter the following details',
            //textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
            )),
      ),
      body: Form(
        key: formkey,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 10.0),
              Text(
                'Email Address',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                  validator: (email) => EmailValidator.validate(email)
                      ? null
                      : "Invalid email address",
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'someone@example.com',
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 3.0,
                      ),
                    ),
                  ),
                  onChanged: (val) {
                    setState(() {
                      emailaddr = val;
                    });
                  }),
              // textInputAction: TextInputAction.next),
              // SizedBox(height: 80.0),
              SizedBox(height: 80.0),
              Text(
                'Permanent Address',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                  validator: (val) => val.isEmpty ? error : null,
                  decoration: InputDecoration(
                    hintText: 'Type your answer here..',
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 3.0,
                      ),
                    ),
                  ),
                  onChanged: (val) {
                    setState(() {
                      permaddr = val;
                    });
                  }),
              SizedBox(height: 80.0),
              Text(
                'Current Address',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                  validator: (val) => val.isEmpty ? error : null,
                  decoration: InputDecoration(
                    hintText: 'Enter "Same" if same as $permaddr',
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 3.0,
                      ),
                    ),
                  ),
                  onChanged: (val) {
                    setState(() {
                      curraddr = val;
                    });
                  }),
              SizedBox(height: 100.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 80.0),
                child: ButtonTheme(
                  height: 60.0,
                  minWidth: 80.0,
                  child: RaisedButton(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(50.0),
                      ),
                      color: Colors.black,
                      splashColor: Colors.yellow,
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: () async {
                        if (formkey.currentState.validate()) {
                          data.emailaddr = emailaddr;
                          data.permaddr = permaddr;
                          data.curraddr = curraddr;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Loan(data: data)));
                        } else {
                          setState(() {
                            error = 'Please enter valid details';
                          });
                        }
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
