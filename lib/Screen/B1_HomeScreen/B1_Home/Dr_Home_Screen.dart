import 'package:flutter/material.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/B1_Home/Calender/dynamic_event.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/B1_Home/Tabbar_View/tabbar_layout.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/B1_Home/appointment.dart';

import 'B1_Home_Profile.dart';

class DrHomeScreen extends StatefulWidget {
  @override
  _DrHomeScreenState createState() => _DrHomeScreenState();
}

class _DrHomeScreenState extends State<DrHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
             shape: BoxShape.circle,
            border: Border.all(color:Color(0xFF121940), )
          ),
          child: Icon(
            Icons.person, color: Color(0xFF121940),size: 65,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text('Dr Arslan',
        style: TextStyle(
          color: Color(0xFF121940),
          fontFamily: 'Sans',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          letterSpacing: 1
        ),),
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => (TabbarLayout())));
          },
          child: DrContainer(titleTxt: 'Appontments'),
        ),
        InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => (DynamicEvent())));
            },
            child: DrContainer(titleTxt: 'Availability Calender')),

        InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => (B1HomeProfile())));
            },
            child: DrContainer(titleTxt: 'Profile'))
      ],
    );
  }

  Widget DrContainer({String titleTxt}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      decoration: BoxDecoration(
          color: Color(0xFF121940),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Center(
        child: Text(
          titleTxt,
          style: TextStyle(
              color: Colors.white,
              letterSpacing: 1,
              fontFamily: 'Sans',
              fontSize: 17),
        ),
      ),
    );
  }
}
