import 'package:flutter/material.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/B1_Home/appointment.dart';

class TodayAppointmnets extends StatefulWidget {
  @override
  _TodayAppointmnetsState createState() => _TodayAppointmnetsState();
}

class _TodayAppointmnetsState extends State<TodayAppointmnets> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [appointmentContainer(), appointmentContainer()],
    );
  }

  Widget appointmentContainer() {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color(0xFF121940),
                              )),
                          child: Icon(
                            Icons.person,
                            size: 50,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 170,
                              child: Text(
                                'Noman Ahmed',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF121940),
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: 170,
                              child: Text(
                                'Sugar, Blood pressure',
                                style: TextStyle(
                                    color: Color(0xFF121940),
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '16-5-2021',
                      style: TextStyle(

                          // color: Color(0xFF121940),
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Time:',
                      style: TextStyle(
                          color: Color(0xFF121940),
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                    Text('16-5-2021')
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 250,
                  child: Text(
                    'I have been feeling high sugar level for some days & my blood pressure is also high in morning',
                    style: TextStyle(),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => (Appointment())));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        // color: Color(0xFF121940),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Text(
                      'Accept',
                      style: TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    'Reject',
                    style: TextStyle(
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
