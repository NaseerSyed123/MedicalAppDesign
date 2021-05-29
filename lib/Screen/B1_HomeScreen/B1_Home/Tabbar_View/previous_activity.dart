import 'package:flutter/material.dart';

class PreviousActivity extends StatefulWidget {
  @override
  _PreviousActivityState createState() => _PreviousActivityState();
}

class _PreviousActivityState extends State<PreviousActivity> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                  ),
                                  Positioned(
                                    left: 28,
                                    child: Container(
                                      width: 22,
                                      height: 22,
                                      decoration: BoxDecoration(
                                          color: Color(0xFF121940),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30))),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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



            ],
          )
        ],
      ),
    );
  }

  Widget previousActivityContainer(
      {Color isColor,
      String,
      titleText,
      Color color1,
      color2,
      color3,
      color4,
      color5,
      color6,
      color7}) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: isColor,
      ),
      title: Text(titleText),
      subtitle: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(color: color1, shape: BoxShape.circle),
          ),
          SizedBox(
            width: 3,
          ),
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(color: color2, shape: BoxShape.circle),
          ),
          SizedBox(
            width: 3,
          ),
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(color: color3, shape: BoxShape.circle),
          ),
          SizedBox(
            width: 3,
          ),
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(color: color4, shape: BoxShape.circle),
          ),
          SizedBox(
            width: 3,
          ),
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(color: color5, shape: BoxShape.circle),
          ),
          SizedBox(
            width: 3,
          ),
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(color: color6, shape: BoxShape.circle),
          ),
          SizedBox(
            width: 3,
          ),
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(color: color7, shape: BoxShape.circle),
          ),
          SizedBox(
            width: 3,
          ),
        ],
      ),
    );
  }
}
