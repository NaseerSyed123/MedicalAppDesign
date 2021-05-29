import 'package:flutter/material.dart';
import 'package:trevashop_v2/AppLayer/Overseer.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/B1_Home/B1_Home_Screen.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/B1_Home/Calender/dynamic_event.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/B1_Home/Tabbar_View/Appointment_Tabbar.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/B1_Home/Tabbar_View/TodayAppointments.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/B1_Home/Tabbar_View/previous_activity.dart';
import 'file:///F:/welldone/trevashop_v2/lib/Screen/B1_HomeScreen/B1_Home/Tabbar_View/Patient_Tabbar/Patient_Appointment_Tabbar.dart';

class TabbarPatient extends StatefulWidget {
  @override
  _TabbarPatientState createState() => _TabbarPatientState();
}

class _TabbarPatientState extends State<TabbarPatient>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "My Appointments",
          style: TextStyle(color: Colors.white, fontFamily: 'Sans'),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => (Menu())));
          },
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                  onPressed: () {}),
              Positioned(
                top: 5,
                left: 5,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Text(
                    '3',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          )
          // IconButton(icon: Icon(Icons.keyboard_arrow_right_outlined, color: Colors.white, size: 35,), onPressed: (){
          //   Navigator.push(context, MaterialPageRoute(builder: (context) => (Appointment())));
          // })
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          isScrollable: true,
          controller: tabController,
          tabs: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 2.5,
              child: Tab(
                child: Text(
                  'Appointments',
                  style: TextStyle(
                      fontSize: 20, color: Colors.white, fontFamily: 'Sans'),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2.5,
              child: Tab(
                child: Text(
                  'History',
                  style: TextStyle(
                      fontSize: 20, color: Colors.white, fontFamily: 'Sans'),
                ),
              ),
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [PatientAppointmentTabbar(), PreviousActivity()],
      ),
    );
  }
}
