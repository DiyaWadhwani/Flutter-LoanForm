import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loan_form/screens/home/name.dart';
import 'datamodel.dart';

class Phnum extends StatefulWidget {
  _PhnumState createState() => _PhnumState();
}

class _PhnumState extends State<Phnum> {
  final data = new DataModel();
  var formkey = GlobalKey<FormState>();
  var mobnum;
  var wanum;
  @override
  Widget build(BuildContext context) {
    String error = 'Please fill this in';
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        elevation: 5.0,
        title: Text('Enter the following details',
            textAlign: TextAlign.center,
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
                'Mobile Number',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                  validator: (val) => val.isEmpty
                      ? error
                      : val.length < 10 ? 'Enter a valid phone number' : null,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    LengthLimitingTextInputFormatter(10),
                    WhitelistingTextInputFormatter.digitsOnly,
                    BlacklistingTextInputFormatter.singleLineFormatter,
                  ],
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
                      mobnum = val;
                    });
                  }),
              SizedBox(height: 80.0),
              Text(
                'Whatsapp Number',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                  validator: (val) => val.isEmpty
                      ? error
                      : val.length < 10 ? 'Enter a valid phone number' : null,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    LengthLimitingTextInputFormatter(10),
                    WhitelistingTextInputFormatter.digitsOnly,
                    BlacklistingTextInputFormatter.singleLineFormatter,
                  ],
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
                      wanum = val;
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
                          data.mobnum = mobnum;
                          data.wanum = wanum;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Name(data: data)));
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
