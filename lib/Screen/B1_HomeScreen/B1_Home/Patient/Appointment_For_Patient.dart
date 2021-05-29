import 'package:flutter/material.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/B1_Home/B1_Home_Dr_List.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/B1_Home/Calender/dynamic_event.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/B1_Home/Calender/splash.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/B1_Home/appointment.dart';
import 'package:trevashop_v2/AppLayer/Overseer.dart';

class AppointmentForPatient extends StatefulWidget {
  @override
  _AppointmentForPatientState createState() => _AppointmentForPatientState();
}

class _AppointmentForPatientState extends State<AppointmentForPatient> {
  // bool isPatient = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF121940),
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Book Appointment',
          style: TextStyle(color: Colors.white, fontFamily: 'sans'),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context,
                MaterialPageRoute(builder: (context) => (B1HomeDrList())));
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [

                   Column(
                children: [
                  Card(
                    elevation: 0.8,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 10),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                            BorderRadius.all(
                                                Radius.circular(30))),
                                      ),
                                      Positioned(
                                        left: 28,
                                        child: Container(
                                          width: 22,
                                          height: 22,
                                          decoration: BoxDecoration(
                                              color: Color(0xFF121940),
                                              borderRadius:
                                              BorderRadius.all(
                                                  Radius.circular(
                                                      30))),
                                          child: Icon(
                                            Icons.video_call,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Dr. Saifullah',
                                        style: TextStyle(
                                            color: Color(0xFF121940),
                                            fontFamily: 'sans',
                                            fontSize: 18),
                                      ),
                                      Text(
                                        'Urologist',
                                        style: TextStyle(
                                            fontFamily: 'sans',
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        'M.B.B.S, F.C.P.S, (Urology)',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: 'sans'),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10)),
                                  color: Color(0xFF121940),
                                ),
                                child: Text(
                                  'Gold',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Under 15 Min',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'sans',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Wait Time',
                                    style: TextStyle(
                                        fontSize: 12, fontFamily: 'sans'),
                                  )
                                ],
                              ),
                              VerticalDivider(
                                width: 3,
                              ),
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '10 year',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'sans',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Experience',
                                    style: TextStyle(
                                        fontSize: 12, fontFamily: 'sans'),
                                  )
                                ],
                              ),
                              VerticalDivider(
                                width: 3,
                              ),
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '100 %',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'sans',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Satisfied',
                                    style: TextStyle(
                                        fontSize: 12, fontFamily: 'sans'),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ),

                  Card(
                    elevation: 0.8,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Book Appointment',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'sans'),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Divider(),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'City Hospital',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'sans'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'Rs. 1500',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'sans'),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.radio_button_checked,
                                            color: Colors.green,
                                            size: 15,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'Available Today',
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontFamily: 'sans',
                                                fontSize: 12),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '9 AM - 2 PM',
                                        style:
                                        TextStyle(fontFamily: 'sans'),
                                      ),
                                      Text(
                                        '2 PM - 6 PM',
                                        style:
                                        TextStyle(fontFamily: 'sans'),
                                      ),
                                      Text(
                                        '9 PM - 11 PM',
                                        style:
                                        TextStyle(fontFamily: 'sans'),
                                      ),
                                    ],
                                  )
                                ],
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        (Appointment())));
                              },
                              child:
                              customButton(txt: 'Book Appointment')),
                          SizedBox(
                            height: 3,
                          ),

                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 14, horizontal: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Color(0xFF121940),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Reviews of Dr. Saifullah',
                                style: TextStyle(
                                    color: Color(0xFF121940),
                                    fontFamily: 'sans',
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Color(0xFF121940),
                                    child: Text(
                                      '97%',
                                      style:
                                      TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Satisfied out of\n862 patients',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text('Doctor Checkup'),
                                  Row(
                                    children: [
                                      Container(
                                        width: 200,
                                        height: 3,
                                        color: Color(0xFF121940),
                                      ),
                                      SizedBox(width: 10),
                                      Text('97%'),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Clinic enviroonment'),
                                  Row(
                                    children: [
                                      Container(
                                        width: 200,
                                        height: 3,
                                        color: Color(0xFF121940),
                                      ),
                                      SizedBox(width: 10),
                                      Text('99%')
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Staff behaviour'),
                                  Row(
                                    children: [
                                      Container(
                                        width: 200,
                                        height: 3,
                                        color: Color(0xFF121940),
                                      ),
                                      SizedBox(width: 10),
                                      Text('98%')
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                                border:
                                Border.all(color: Colors.grey[100]),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10))),
                            child: Text(
                              'Highly recmended',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 12),
                            decoration: BoxDecoration(
                                border:
                                Border.all(color: Colors.blue[900]),
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.all(Radius.circular(5))),
                            child: Text(
                              'View all',
                              style: TextStyle(color: Colors.blue[900]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          )


        ],
      ),
    );
  }

  Widget profileContainer(
      {String titleText, String subTitleText, IconData icon}) {
    return ListTile(
      leading: Icon(
        icon,
        color: Color(0xFF121940),
      ),
      title: Text(
        titleText,
        style: TextStyle(
          color: Color(0xFF121940),
        ),
      ),
      subtitle: Text(
        subTitleText,
        style: TextStyle(
          color: Color(0xFF121940),
        ),
      ),
    );
  }

  Widget customButton({String txt}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Text(
        txt,
        style: TextStyle(color: Colors.white, fontFamily: 'sans'),
      ),
      alignment: Alignment.center,
    );
  }
}
