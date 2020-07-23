import 'package:flutter/material.dart';
import 'package:loan_form/screens/home/terms.dart';
import 'datamodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: must_be_immutable
class Loan extends StatefulWidget {
  DataModel data;
  Loan({this.data});
  _LoanState createState() => _LoanState(data: data);
}

class _LoanState extends State<Loan> {
  final db = Firestore.instance;
  var loanamount;
  var loantenure;
  DataModel data;
  _LoanState({this.data});
  List<String> _amount = ['Rs.2000', 'Rs.3000', 'Rs.4000', 'Rs.5000'];
  List<String> _time = ['15 days', '20 days'];
  var _selectedAmount;
  var _selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 5.0,
        title: Text(
          'Please select from below options',
          style: TextStyle(
            fontSize: 20.0,
            //color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 80.0),
            Text(
              'Loan Amount',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: 28.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 30.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 70.0),
              child: DropdownButton(
                hint: _selectedAmount == null
                    ? Text('Select an option')
                    : Text(
                        _selectedAmount,
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                isExpanded: true,
                iconSize: 40.0,
                iconEnabledColor: Colors.white,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
                items: _amount.map(
                  (val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Text(val),
                    );
                  },
                ).toList(),
                onChanged: (val) {
                  setState(
                    () {
                      _selectedAmount = val;
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 80.0),
            Text(
              'Loan Tenure',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: 28.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              '(Processing Fee : 300, Interest Rate : 1.23%)',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 30.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 70.0),
              child: DropdownButton(
                hint: _selectedTime == null
                    ? Text('Select an option')
                    : Text(
                        _selectedTime,
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                isExpanded: true,
                iconSize: 40.0,
                iconEnabledColor: Colors.white,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
                items: _time.map(
                  (val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Text(val),
                    );
                  },
                ).toList(),
                onChanged: (val) {
                  setState(
                    () {
                      _selectedTime = val;
                    },
                  );
                },
              ),
            ),
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
                      if (_selectedAmount == null || _selectedTime == null) {
                        showAlertDialog(context);
                      } else {
                        data.loanamount = _selectedAmount;
                        data.loantenure = _selectedTime;
                        await db.collection("ApplicantDetails").add({
                          'Mobile Number': data.mobnum,
                          'Whatsapp Number': data.wanum,
                          'Full Name': data.firstname,
                          'Father/Husbands Name': data.secondname,
                          'Email Address': data.emailaddr,
                          'Permanent Address': data.permaddr,
                          'Current Address': data.curraddr,
                          'Loan Amount': data.loanamount,
                          'Loan Tenure': data.loantenure
                        });
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Terms()));
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

showAlertDialog(BuildContext context) {
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Error"),
    content: Text('Please select both Amount and Tenure before procedding'),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
