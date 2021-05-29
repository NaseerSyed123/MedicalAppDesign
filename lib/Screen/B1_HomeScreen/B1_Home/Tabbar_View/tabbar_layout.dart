import 'package:flutter/material.dart';
import 'package:trevashop_v2/AppLayer/Overseer.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/B1_Home/Calender/dynamic_event.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/B1_Home/Tabbar_View/Appointment_Tabbar.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/B1_Home/Tabbar_View/TodayAppointments.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/B1_Home/Tabbar_View/previous_activity.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/B1_Home/appointment.dart';


class TabbarLayout extends StatefulWidget {
  @override
  _TabbarLayoutState createState() => _TabbarLayoutState();
}

class _TabbarLayoutState extends State<TabbarLayout>
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
        title:

        Text("All Appointments",
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Sans'
        ),),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(icon: Icon( Icons.notifications, color: Colors.white,), onPressed: (){}),
              Positioned(
                top: 5,
                left: 5,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Text('3',
                  style: TextStyle(
                    color: Colors.white
                  ),),
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
                  style: TextStyle(fontSize: 20,
                      color: Colors.white,
                      fontFamily: 'Sans'
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2.5,
              child: Tab(
                child: Text(
                  'History',
                  style: TextStyle(fontSize: 20,
                      color: Colors.white,
                      fontFamily: 'Sans'
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [AppointmentTabbar(), PreviousActivity()],
      ),
    );
  }
}
