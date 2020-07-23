import 'package:flutter/material.dart';
import 'package:loan_form/screens/home/addr.dart';
import 'datamodel.dart';

// ignore: must_be_immutable
class Name extends StatefulWidget {
  DataModel data;
  Name({this.data});
  _NameState createState() => _NameState(data: data);
}

class _NameState extends State<Name> {
  var formkey = GlobalKey<FormState>();
  var firstname;
  var secondname;
  DataModel data;
  _NameState({this.data});
  @override
  Widget build(BuildContext context) {
    String error = 'Please fill this in';
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 5.0,
        title: Text('Enter the following details',
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
              SizedBox(height: 80.0),
              Text(
                'Full Name',
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
                      firstname = val;
                    });
                  }),
              SizedBox(height: 80.0),
              Text(
                'Father/Husbands Name',
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
                      secondname = val;
                    });
                  }),
              SizedBox(height: 150.0),
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
                          data.firstname = firstname;
                          data.secondname = secondname;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Address(data: data)));
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
