import 'package:flutter/material.dart';
import 'package:loan_form/screens/authenticate/sign_in.dart';
import 'package:loan_form/screens/services/auth.dart';
// import 'package:loan_form/screens/services/auth.dart';

// ignore: must_be_immutable
class Terms extends StatefulWidget {
  var mobnum;
  var wanum;
  var firstname;
  var secondname;
  var emailaddr;
  var permaddr;
  var curraddr;
  var loanamount;
  var loantenure;
  Terms(
      {this.mobnum,
      this.wanum,
      this.firstname,
      this.secondname,
      this.emailaddr,
      this.permaddr,
      this.curraddr,
      this.loanamount,
      this.loantenure});
  _TermsState createState() => _TermsState(
        mobnum: mobnum,
        wanum: wanum,
        firstname: firstname,
        secondname: secondname,
        emailaddr: emailaddr,
        permaddr: permaddr,
        curraddr: curraddr,
        loanamount: loanamount,
        loantenure: loantenure,
      );
}

class _TermsState extends State<Terms> {
  var mobnum;
  var wanum;
  var firstname;
  var secondname;
  var emailaddr;
  var permaddr;
  var curraddr;
  var loanamount;
  var loantenure;
  _TermsState(
      {this.mobnum,
      this.wanum,
      this.firstname,
      this.secondname,
      this.emailaddr,
      this.permaddr,
      this.curraddr,
      this.loanamount,
      this.loantenure});
  final AuthService _auth = AuthService();
  bool checkedValue = false;

  // // ignore: must_call_super
  // Future<void> initState() async {
  //   return checkedValue = false;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 5.0,
        title: Text('Terms and Conditions',
            //textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
            )),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
        child: ListView(
          children: <Widget>[
            Text(
              'I("the Applicant(s)"), hereby unconditionally and irrevocably declare and confirm that :',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 20.0),
            new ListTile(
              leading: new MyBullet(),
              title: new Text(
                'The application for a lending facility (“Facility”) from Pluto Consultancy Management Private Limited (“the Lender/ Company”)',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            new ListTile(
              leading: new MyBullet(),
              title: new Text(
                'I fully acknowledge that the grant of the Facility is at the sole discretion of Lender and also acknowledge that the Lender reserves the right to reject my application for such a facility without assigning any reasons whatsoever; the Lender will not be responsible/liable in any manner whatsoever to me/us for such rejection or any delay in notifying me of such rejection, of my application ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            new ListTile(
              leading: new MyBullet(),
              title: new Text(
                'I understand and acknowledge that the Lender and/or the Company reserve the right to retain all applicable information, photographs and other KYC documents submitted by me (forming part of such application and this declaration) and may not return the same to me',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            new ListTile(
              leading: new MyBullet(),
              title: new Text(
                'I authorize the Lender/ Company, their agents to make references and enquires relevant to information in this application form as per their discretion. Further, I have no objection to the Lender and/or Company from sending me promotional offers of their products or services (including those of their subsidiaries, affiliates or associate companies',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            new ListTile(
              leading: new MyBullet(),
              title: new Text(
                'I have noted that the Lender has a Policy as per which applicable rate of interest is determined based on various types of risks, cost of funds, tenor of the loan, collateral, amount of loan etc. and rate of interest may differ from customer to customer and loan to loan.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            new ListTile(
              leading: new MyBullet(),
              title: new Text(
                'I confirm that I have gone through the Interest Rate Policy and Schedule of Charges of the Lender, which are also available on its website',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            new ListTile(
              leading: new MyBullet(),
              title: new Text(
                'I also acknowledge that the Company shall have the right to seek information pertaining to [me/us] from regulatory authorities and other third parties including, interalia, the RBI, the CBIL, etc. in accordance with the applicable law',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            CheckboxListTile(
              title: Text(
                'I agree',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              value: checkedValue,
              onChanged: (bool newValue) {
                setState(() {
                  checkedValue = newValue;
                });
              },
              activeColor: Colors.green,
              checkColor: Colors.black,
            ),
            SizedBox(height: 50.0),
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
                      'SUBMIT',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () async {
                      if (checkedValue == false) {
                        showAlertDialog(context);
                      } else {
                        await _auth.signOut();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignIn()));
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

class MyBullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 10.0,
      width: 10.0,
      decoration: new BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
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
    content: Text(
        'Please agree to the above mentioned Terms and Conditions to complete the application'),
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
