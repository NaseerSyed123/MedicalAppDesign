import 'package:flutter/material.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/B1_Home/B1_Home_Profile.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/B1_Home/Patient/Appointment_For_Patient.dart';

class B1HomeDrList extends StatefulWidget {
  @override
  _B1HomeDrListState createState() => _B1HomeDrListState();
}

class _B1HomeDrListState extends State<B1HomeDrList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF121940),
        title: Text(
          'Urologists in Islamabad',
          style: TextStyle(color: Colors.white, fontFamily: 'sans'),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.phone,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
      body: Column(
        children: [
          Card(
            elevation: 0.8,
            child: Padding(
              padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: textFieldContainer(
                        txt: 'Doctors, hospitals, specialties, services '),
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // Container(
                  //   height: 30,
                  //   child: ListView(
                  //     scrollDirection: Axis.horizontal,
                  //     children: [
                  //       filterContainer(filterTxt: 'Discount'),
                  //       SizedBox(
                  //         width: 5,
                  //       ),
                  //       filterContainer(filterTxt: 'Near me'),
                  //       SizedBox(
                  //         width: 5,
                  //       ),
                  //       filterContainer(filterTxt: 'Video consult'),
                  //       SizedBox(
                  //         width: 5,
                  //       ),
                  //       filterContainer(filterTxt: 'Availability'),
                  //       SizedBox(
                  //         width: 5,
                  //       ),
                  //       filterContainer(filterTxt: 'Gender'),
                  //       SizedBox(
                  //         width: 5,
                  //       ),
                  //       filterContainer(filterTxt: 'online now'),
                  //       SizedBox(
                  //         width: 5,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 0.5,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
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
                                                          Radius.circular(
                                                              30))),
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
                                                  fontSize: 18,
                                                  letterSpacing: 1),
                                            ),
                                            Text(
                                              'Urologist',
                                              style: TextStyle(
                                                  letterSpacing: 1,
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
                                  height: 5,
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
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'sans'),
                                        ),
                                        Text(
                                          'Wait Time',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'sans'),
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
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'sans'),
                                        ),
                                        Text(
                                          'Experience',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'sans'),
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
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Satisfied',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'sans'),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 55,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Zeenat Medical Complex',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'sans',
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 8,
                                              height: 8,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.green),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Available on monday',
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 12),
                                            )
                                          ],
                                        ),
                                        Text(
                                          'Rs. 1000',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              child: SizedBox(
                                height: 40,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    // Container(
                                    //   padding: EdgeInsets.symmetric(
                                    //       horizontal: 5, vertical: 10),
                                    //   decoration: BoxDecoration(
                                    //     border: Border.all(
                                    //         color: Colors.blue[800]),
                                    //     borderRadius: BorderRadius.all(
                                    //         Radius.circular(5)),
                                    //   ),
                                    //   child: Row(
                                    //     children: [
                                    //       Icon(
                                    //         Icons.video_call_outlined,
                                    //         color: Colors.blue[800],
                                    //         size: 15,
                                    //       ),
                                    //       Text(
                                    //         'Video consultant',
                                    //         style: TextStyle(
                                    //             color: Colors.blue[900]),
                                    //       )
                                    //     ],
                                    //   ),
                                    // ),

                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    (AppointmentForPatient())));
                                      },
                                      child: Container(
                                          height: 45,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          decoration: BoxDecoration(
                                            color: Colors.orange,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                          ),
                                          child: Text(
                                            'Book Appoinment',
                                            style: TextStyle(
                                                fontFamily: 'Sans',
                                                color: Colors.white),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  })),
        ],
      ),
    );
  }

  Widget filterContainer({String filterTxt}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF121940)),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Text(
        filterTxt,
        style: TextStyle(color: Color(0xFF121940)),
      ),
    );
  }

  Widget textFieldContainer({String txt}) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      cursorColor: Color(0xFF121940),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 5,
        ),
        hintText: txt,
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.grey[400],
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: Colors.grey[400],
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: Colors.grey[400],
          ),
        ),
      ),
    );
  }
}
