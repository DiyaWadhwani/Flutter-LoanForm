import 'package:flutter/material.dart';
import 'package:loan_form/screens/home/terms.dart';

// ignore: must_be_immutable
class Loan extends StatefulWidget {
  var mobnum;
  var wanum;
  var firstname;
  var secondname;
  var emailaddr;
  var permaddr;
  var curraddr;
  Loan(
      {this.mobnum,
      this.wanum,
      this.firstname,
      this.secondname,
      this.emailaddr,
      this.permaddr,
      this.curraddr});
  _LoanState createState() => _LoanState(
      mobnum: mobnum,
      wanum: wanum,
      firstname: firstname,
      secondname: secondname,
      emailaddr: emailaddr,
      permaddr: permaddr,
      curraddr: curraddr);
}

class _LoanState extends State<Loan> {
  var mobnum;
  var wanum;
  var firstname;
  var secondname;
  var emailaddr;
  var permaddr;
  var curraddr;
  var loanamount;
  var loantenure;
  _LoanState(
      {this.mobnum,
      this.wanum,
      this.firstname,
      this.secondname,
      this.emailaddr,
      this.permaddr,
      this.curraddr});
  List<String> _amount = ['Rs.2000', 'Rs.3000', 'Rs.4000', 'Rs.5000'];
  List<String> _time = ['15 days', '20 days'];
  String _selectedAmount = 'Select an option';
  String _selectedTime = 'Select an option';

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
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Terms(
                                  mobnum: mobnum,
                                  wanum: wanum,
                                  firstname: firstname,
                                  secondname: secondname,
                                  emailaddr: emailaddr,
                                  permaddr: permaddr,
                                  curraddr: curraddr)));
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}