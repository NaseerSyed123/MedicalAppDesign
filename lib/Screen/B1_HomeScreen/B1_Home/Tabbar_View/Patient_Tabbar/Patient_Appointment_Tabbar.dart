import 'package:flutter/material.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/B1_Home/Tabbar_View/Patient_Appointment.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/B1_Home/Tabbar_View/TodayAppointments.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/B1_Home/Tabbar_View/previous_activity.dart';

class PatientAppointmentTabbar extends StatefulWidget {
  @override
  _PatientAppointmentTabbarState createState() => _PatientAppointmentTabbarState();
}

class _PatientAppointmentTabbarState extends State<PatientAppointmentTabbar> with SingleTickerProviderStateMixin{
  TabController appointmentTabbar;

  void initState() {
    appointmentTabbar = TabController(length: 3, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TabBar(
            indicatorColor: Color(0xFF121940),
            isScrollable: true,
            controller: appointmentTabbar,
            tabs: <Widget>[

              Container(
                width: MediaQuery.of(context).size.width /4,
                child: Tab(
                  child: Text(
                    'Today',
                    style: TextStyle(
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF121940),
                        fontFamily: 'Sans'
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width /4,
                child: Tab(
                  child: Text(
                    'One Week',
                    style: TextStyle(
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF121940),
                        fontFamily: 'Sans'
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width /4,
                child: Tab(
                  child: Text(
                    'One Month',
                    style: TextStyle(
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF121940),
                        fontFamily: 'Sans'
                    ),
                  ),
                ),
              ),

            ],
          ),
          Expanded(
            child: TabBarView(
                controller: appointmentTabbar,
                children: <Widget>[
                  PatientAppointment(),
                  PreviousActivity(),
                  TodayAppointmnets(),



                ]),
          )
        ],
      ),

    );

  }
}
