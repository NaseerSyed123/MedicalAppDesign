import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:trevashop_v2/AppLayer/Overseer.dart';
import 'package:trevashop_v2/Library/Language_Library/lib/easy_localization_delegate.dart';
import 'package:trevashop_v2/Library/Language_Library/lib/easy_localization_provider.dart';
import 'package:flutter/material.dart';

import 'Login.dart';
import 'LoginAnimation.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> with TickerProviderStateMixin {
  int theriGroupVakue = 0;

  final Map<int, Widget> logoWidgets = const <int, Widget>{
    0: Text(
      "Patient",
      style: TextStyle(fontSize: 18, fontFamily: "Sans"),
    ),
    1: Text(
      "Doctor",
      style: TextStyle(fontSize: 18, fontFamily: "Sans"),
    ),
  };

  List<Widget> bodies = [
    patientSignup(false),
    patientSignup(true),

    // giveCenter("Chat Room")
  ];

  //Animation Declaration
  AnimationController sanimationController;
  AnimationController animationControllerScreen;
  Animation animationScreen;
  var tap = 0;

  /// Set AnimationController to initState
  @override
  void initState() {
    sanimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800))
          ..addStatusListener((statuss) {
            if (statuss == AnimationStatus.dismissed) {
              setState(() {
                tap = 0;
              });
            }
          });
    // TODO: implement initState
    super.initState();
  }

  /// Dispose animationController
  @override
  void dispose() {
    sanimationController.dispose();
    super.dispose();
  }

  /// Playanimation set forward reverse
  Future<Null> _PlayAnimation() async {
    try {
      await sanimationController.forward();
      await sanimationController.reverse();
    } on TickerCanceled {}
  }

  /// Component Widget layout UI
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    mediaQueryData.devicePixelRatio;
    mediaQueryData.size.height;
    mediaQueryData.size.width;

    var data = EasyLocalizationProvider.of(context).data;
    return EasyLocalizationProvider(
      data: data,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 25.0),
            child: Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 10.0),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: MaterialSegmentedControl(
                      selectionIndex: theriGroupVakue,

                      selectedColor: Color(0xFF6E48AA),
                      unselectedColor: Colors.white,
                      borderColor: Color(0xFF121940),
                      borderRadius: 20,
                      onSegmentChosen: (index) {
                        setState(() {
                          theriGroupVakue = index;
                        });
                      },

                      children: logoWidgets,
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                ],
              ),
            ),
          ),
        ),
        body: bodies[theriGroupVakue],
      ),
    );
  }

  static Widget patientSignup(bool isPatient) {
    return Stack(
      children: <Widget>[
        Container(
          /// Set Background image in layout
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //   image: AssetImage("assets/img/backgroundgirl.png"),
          //   fit: BoxFit.cover,
          // )),
          child: Container(
            /// Set gradient color in image
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(0, 0, 0, 0.2),
                  Color.fromRGBO(0, 0, 0, 0.3)
                ],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
              ),
            ),

            /// Set component layout
            child: ListView(
              padding: EdgeInsets.all(0.0),
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      alignment: AlignmentDirectional.topCenter,
                      child: Column(
                        children: <Widget>[
                          /// padding logo
                          Padding(padding: EdgeInsets.only(top: 110.0)),
                          isPatient
                              ? Text(
                                  'Signup as Doctor',
                                  style: TextStyle(
                                      fontFamily: 'Sans',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Color(0xFF6E48AA)),
                                )
                              : Text('Signup as Patient',
                                  style: TextStyle(
                                      fontFamily: 'Sans',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Color(0xFF6E48AA))),

                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0)),
                          textFromField(
                            icon: Icons.person,
                            password: false,
                            email: 'Name',
                            inputType: TextInputType.emailAddress,
                          ),
                          Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                          textFromField(
                            icon: Icons.supervised_user_circle_outlined,
                            password: false,
                            email: 'Username',
                            inputType: TextInputType.emailAddress,
                          ),

                          Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),

                          /// TextFromField Email
                          textFromField(
                            icon: Icons.email,
                            password: false,
                            email: 'Email',
                            inputType: TextInputType.emailAddress,
                          ),
                          Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),

                          /// TextFromField Password
                          textFromField(
                            icon: Icons.vpn_key,
                            password: true,
                            email: 'password',
                            inputType: TextInputType.text,
                          ),
                          Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),

                          textFromField(
                            icon: Icons.vpn_key,
                            password: true,
                            email: 'Confirm Password',
                            inputType: TextInputType.text,
                          ),
                          if (isPatient)
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: textFromField(
                                icon: Icons.person,
                                password: false,
                                email: 'Specielization',
                                inputType: TextInputType.emailAddress,
                              ),
                            ),

                          Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                          textFromField(
                            icon: Icons.person,
                            password: false,
                            email: 'Gender',
                            inputType: TextInputType.emailAddress,
                          ),
                          Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                          textFromField(
                            icon: Icons.supervised_user_circle_outlined,
                            password: false,
                            email: 'Age',
                            inputType: TextInputType.number,
                          ),
                          Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                          textFromField(
                            icon: Icons.supervised_user_circle_outlined,
                            password: false,
                            email: 'Address',
                            inputType: TextInputType.emailAddress,
                          ),

                          /// Button Login

                          FlatButton(
                              padding: EdgeInsets.only(top: 20.0),
                              onPressed: () {
                                // Navigator.of(context).pushReplacement(
                                //     MaterialPageRoute(
                                //         builder: (BuildContext context) =>
                                //         new loginScreen()));
                              },
                              child: Text(
                                'not have login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Sans"),
                              )),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0, bottom: 0.0),
                          ),
                          isPatient ?
                          buttonSignupBottom(): buttonSignupDoctor()
                        ],
                      ),
                    ),
                  ],
                ),

                /// Set Animaion after user click buttonLogin
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// textfromfield custom class
class textFromField extends StatelessWidget {
  bool password;
  String email;
  IconData icon;

  TextInputType inputType;

  textFromField({
    this.email,
    this.icon,
    this.inputType,
    this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        height: 45.0,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.0),
            color: Colors.white,
            boxShadow: [BoxShadow(blurRadius: 10.0, color: Colors.black12)]),
        padding:
            EdgeInsets.only(left: 20.0, right: 30.0, top: 0.0, bottom: 0.0),
        child: Theme(
          data: ThemeData(
            hintColor: Colors.transparent,
          ),
          child: TextFormField(
            obscureText: password,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: email,
                hintStyle: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Sans',
                    letterSpacing: 0.3,
                    color: Colors.black38,
                    fontWeight: FontWeight.w600),
                icon: Icon(
                  icon,
                  color: Colors.black38,
                ),
                labelStyle: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Sans',
                    letterSpacing: 0.3,
                    color: Colors.black38,
                    fontWeight: FontWeight.w600)),
            keyboardType: inputType,
          ),
        ),
      ),
    );
  }
}

///ButtonBlack class
class buttonSignupBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: () {
        Overseer.userRole = 'Patient';

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => loginScreen()));
      },
      child: Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Container(
          height: 45.0,
          width: 600.0,
          child: Text(
            AppLocalizations.of(context).tr('Signup as Doctor'),
            style: TextStyle(
                color: Colors.white,
                letterSpacing: 0.2,
                fontFamily: "Sans",
                fontSize: 18.0,
                fontWeight: FontWeight.w800),
          ),
          alignment: FractionalOffset.center,
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 15.0)],
              borderRadius: BorderRadius.circular(30.0),
              gradient: LinearGradient(
                  colors: <Color>[Color(0xFF121940), Color(0xFF6E48AA)])),
        ),
      ),
    );
  }
}
class buttonSignupDoctor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Overseer.userRole = 'Doctor';

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => loginScreen()));
      },
      child: Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Container(
          height: 45.0,
          width: 600.0,
          child: Text(
            AppLocalizations.of(context).tr('Signup as Patient'),
            style: TextStyle(
                color: Colors.white,
                letterSpacing: 0.2,
                fontFamily: "Sans",
                fontSize: 18.0,
                fontWeight: FontWeight.w800),
          ),
          alignment: FractionalOffset.center,
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 15.0)],
              borderRadius: BorderRadius.circular(30.0),
              gradient: LinearGradient(
                  colors: <Color>[Color(0xFF121940), Color(0xFF6E48AA)])),
        ),
      ),
    );
  }
}
