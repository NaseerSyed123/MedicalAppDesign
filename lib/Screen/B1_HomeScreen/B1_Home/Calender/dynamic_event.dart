import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/B1_Home/B1_Home_Profile.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/B1_Home/Tabbar_View/tabbar_layout.dart';
import 'package:trevashop_v2/AppLayer/Overseer.dart';

import '../appointment.dart';

class DynamicEvent extends StatefulWidget {
  @override
  _DynamicEventState createState() => _DynamicEventState();
}

class _DynamicEventState extends State<DynamicEvent> {
  CalendarController _controller;
  Map<DateTime, List<dynamic>> _events;
  List<dynamic> _selectedEvents;
  TextEditingController _eventController;
  SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    _eventController = TextEditingController();
    _events = {};
    _selectedEvents = [];
    prefsData();
  }

  prefsData() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _events = Map<DateTime, List<dynamic>>.from(
          decodeMap(json.decode(prefs.getString("events") ?? "{}")));
    });
  }

  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }

  Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }

  bool isPatient = false;
  bool selectDate = false;

  @override
  Widget build(BuildContext context) {
    if (Overseer.userRole == 'Patient') {
      isPatient = true;
    } else {
      isPatient = false;
    }

    print('user role is ${Overseer.userRole}');
    print('ispatient is  ${isPatient}');
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Book Appointment',
          style: TextStyle(color: Colors.white),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => (B1HomeProfile())));
          },
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                color: Colors.white,
                padding:
                    EdgeInsets.only(left: 10, top: 15, right: 10, bottom: 0),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          child: Icon(
                            Icons.person,
                            size: 45,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dr. Saifullah',
                              style: TextStyle(
                                  fontSize: 17,
                                  // letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Sans'),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              'Buch International Hospital (BIH)',
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Sans'),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    isPatient
                        ? Container(
                            height: 90.0,
                            alignment: AlignmentDirectional.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10.0, color: Colors.black12)
                                ]),
                            padding: EdgeInsets.only(
                                left: 20.0, right: 30.0, top: 0.0, bottom: 0.0),
                            child: TextFormField(
                              cursorColor: Colors.black,
                              minLines: 6,
                              // any number you need (It works as the rows for the textarea)
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              decoration: InputDecoration(
                                  hintText: 'Purpose of Appointment',
                                  border: InputBorder.none,
                                  labelStyle: TextStyle(
                                      fontSize: 15.0,
                                      fontFamily: 'Sans',
                                      letterSpacing: 0.3,
                                      color: Colors.grey[200],
                                      fontWeight: FontWeight.w600)),
                            ),
                          )
                        : Container(),
                    SizedBox(
                      height: 5,
                    ),
                    isPatient
                        ? Text(
                            'I want to consult doctor for sugar checkup. I want to consult doctor for sugar checkup. I want to consult doctor for sugar checkup. ')
                        : Container(),
                    SizedBox(
                      height: 5,
                    ),
                    isPatient
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Appointment Time:',
                                    style: TextStyle(
                                      letterSpacing: 0.3,
                                      fontFamily: 'Sans',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '5 PM to 6 PM',
                                    style: TextStyle(
                                      fontFamily: 'Sans',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              InkWell(
                                splashColor: Colors.white,
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              (TabbarLayout())));
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Colors.orange),
                                  child: Text(
                                    'Request Appointment',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Sans',
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        : Container()
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10, bottom: 10),
                  child: Text(
                    'Select Date',
                    style: TextStyle(
                        fontFamily: 'Sans',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),
                  ),
                ),
                InkWell(
                  // onTap: (){
                  //   Navigator.push(context, MaterialPageRoute(builder: (context) => ()))
                  // },
                  splashColor: Colors.grey,
                  child: Padding(
                    padding: EdgeInsets.only(right: 10, bottom: 10),
                    child: Text(
                      'View More >',
                      style: TextStyle(
                          color: Colors.orange,
                          fontFamily: 'Sans',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                  ),
                ),
              ],
            ),
            Card(
              elevation: 5,
              child: TableCalendar(
                events: _events,
                initialCalendarFormat: CalendarFormat.week,
                calendarStyle: CalendarStyle(
                    canEventMarkersOverflow: true,
                    todayColor: Colors.orange,
                    selectedColor: Theme.of(context).primaryColor,
                    todayStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.white)),
                headerStyle: HeaderStyle(
                  centerHeaderTitle: true,
                  formatButtonDecoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  formatButtonTextStyle: TextStyle(color: Colors.white),
                  formatButtonShowsNext: false,
                ),
                startingDayOfWeek: StartingDayOfWeek.monday,
                onDaySelected: (date, events, holidays) {
                  setState(() {
                    _selectedEvents = events;
                  });
                },
                builders: CalendarBuilders(
                  selectedDayBuilder: (context, date, events) => Container(
                      margin: const EdgeInsets.all(4.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(color: Colors.white),
                      )),
                  todayDayBuilder: (context, date, events) => Container(
                      margin: const EdgeInsets.all(4.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                calendarController: _controller,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10, bottom: 10),
                  child: Text(
                    'Select Time',
                    style: TextStyle(
                        fontFamily: 'Sans',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),
                  ),
                ),
                InkWell(
                  child: Padding(
                    padding: EdgeInsets.only(right: 10, bottom: 10),
                    child: Text(
                      'View More >',
                      style: TextStyle(
                          color: Colors.orange,
                          fontFamily: 'Sans',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
                height: 220,
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Card(
                          child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        child: Text(
                          '3 PM to 5 PM',
                          style: TextStyle(
                              fontFamily: 'Sans',
                              letterSpacing: 1,
                              fontSize: 18),
                        ),
                      ));
                    }))
            // ..._selectedEvents.map((event) => Padding(
            //       padding: const EdgeInsets.only(
            //         left: 8.0,
            //         right: 8,
            //       ),
            //       child: Center(
            //         child: Card(
            //           child: Container(
            //             height: MediaQuery.of(context).size.height / 20,
            //             width: MediaQuery.of(context).size.width / 1,
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(30),
            //               color: Colors.white,
            //               // border: Border.all(color: Colors.red)
            //             ),
            //             child: Text(
            //               event,
            //               style: TextStyle(
            //                   color: Colors.blue,
            //                   fontWeight: FontWeight.bold,
            //                   fontSize: 16),
            //             ),
            //           ),
            //         ),
            //       ),
            //     )),
          ],
        ),
      ),
      floatingActionButton: !isPatient
          ? FloatingActionButton(
              backgroundColor: Colors.black,
              child: Icon(Icons.add),
              onPressed: _showAddDialog,
            )
          : null,
    );
  }

  _showAddDialog() async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            content: Container(
              height: 370,
              child: Column(
                children: [
                  Text(
                    'Add Timings',
                    style: TextStyle(
                        fontFamily: 'Sans',
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 260,
                    child: ListView(
                      children: [
                        Card(
                          elevation: 5,
                          child: CheckboxListTile(
                              activeColor: Colors.black,
                              title: Text(
                                '3 PM to 4 PM',
                                style: TextStyle(color: Colors.black),
                              ),
                              value: selectDate,
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (bool value) {
                                setState(() {
                                  selectDate = value;
                                });
                              }),
                        ),
                        Card(
                          elevation: 5,
                          child: CheckboxListTile(
                              activeColor: Colors.black,
                              title: Text(
                                '3 PM to 4 PM',
                                style: TextStyle(color: Colors.black),
                              ),
                              value: selectDate,
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (bool value) {
                                setState(() {
                                  selectDate = value;
                                });
                              }),
                        ),
                        Card(
                          elevation: 5,
                          child: CheckboxListTile(
                              activeColor: Colors.black,
                              title: Text(
                                '3 PM to 4 PM',
                                style: TextStyle(color: Colors.black),
                              ),
                              value: selectDate,
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (bool value) {
                                setState(() {
                                  selectDate = value;
                                });
                              }),
                        ),
                        Card(
                          elevation: 5,
                          child: CheckboxListTile(
                              activeColor: Colors.black,
                              title: Text(
                                '3 PM to 4 PM',
                                style: TextStyle(color: Colors.black),
                              ),
                              value: selectDate,
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (bool value) {
                                setState(() {
                                  selectDate = value;
                                });
                              }),
                        ),
                        Card(
                          elevation: 5,
                          child: CheckboxListTile(
                              activeColor: Colors.black,
                              title: Text(
                                '3 PM to 4 PM',
                                style: TextStyle(color: Colors.black),
                              ),
                              value: selectDate,
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (bool value) {
                                setState(() {
                                  selectDate = value;
                                });
                              }),
                        ),
                        Card(
                          elevation: 5,
                          child: CheckboxListTile(
                              activeColor: Colors.black,
                              title: Text(
                                '3 PM to 4 PM',
                                style: TextStyle(color: Colors.black),
                              ),
                              value: selectDate,
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (bool value) {
                                setState(() {
                                  selectDate = value;
                                });
                              }),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 200,
                    color: Colors.white,
                    child: Container(
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: FlatButton(
                        splashColor: Colors.white,
                        child: Text(
                          "Save",
                          style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 1,
                              fontFamily: 'Sans',
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          if (_eventController.text.isEmpty) return;
                          setState(() {
                            if (_events[_controller.selectedDay] != null) {
                              _events[_controller.selectedDay]
                                  .add(_eventController.text);
                            } else {
                              _events[_controller.selectedDay] = [
                                _eventController.text
                              ];
                            }
                            prefs.setString(
                                "events", json.encode(encodeMap(_events)));
                            _eventController.clear();
                            Navigator.pop(context);
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )

            ));
  }
}
