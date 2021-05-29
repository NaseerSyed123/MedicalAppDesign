import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trevashop_v2/AppLayer/Overseer.dart';

class Appointment extends StatefulWidget {
  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;

  go(int step) {
    setState(() => _currentStep = _currentStep + step);
  }

  bool isPatient = false;

  File imageFile;

  openGallery(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  openCamera(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  Future<void> showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Make a choice'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text("Gallery"),
                    onTap: () {
                      openGallery(context);
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    child: Text("Camera"),
                    onTap: () {
                      openCamera(context);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _decideImageView() {
    if (imageFile == null) {
      return Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Text(
          'Upload Image',
          style: TextStyle(color: Colors.grey, fontSize: 20),
        ),
      );
    } else {
      return Image.file(imageFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Appointment Process',
          style: TextStyle(fontFamily: 'sans', color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            elevation: 5,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Color(0xFF121940))),
                            child: Icon(
                              Icons.person,
                              color: Color(0xFF121940),
                              size: 55,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          isPatient
                              ? Text(
                                  'Syed Hassan',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Sans'),
                                )
                              : Text(
                                  'Dr Saif',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Sans'),
                                )
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '5-11-2021',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontFamily: 'Sans'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Time:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontFamily: 'Sans'),
                      ),
                      Text(
                        '4 AM to 5 AM',
                        style:
                            TextStyle(color: Colors.black, fontFamily: 'Sans'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Stepper(
              type: stepperType,
              physics: ScrollPhysics(),
              currentStep: _currentStep,
              onStepTapped: (step) => tapped(step),
              onStepContinue: () {
                if (_currentStep != 3) {
                  go(1);
                }

                if (_currentStep == 0) {
                  // confirmrequest();
                } else if (_currentStep == 1) {
                  // gotoClicnic();
                } else if (_currentStep == 2) {
                  //checkeinClinic();
                } else {
                  //doctorNotes();
                }
              },
              onStepCancel: () {
                if (_currentStep != 0) {
                  go(-1);
                }
              },
              controlsBuilder: (BuildContext context,
                  {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                print(' current step is $_currentStep');

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: onStepContinue,
                        child: Text(
                          _currentStep == 0
                              ? 'Confirm Request'
                              : 'Go to Clinic',
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Sans',
                              letterSpacing: 1),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      TextButton(
                        onPressed: onStepCancel,
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Sans',
                              letterSpacing: 1),
                        ),
                      ),
                    ],
                  ),
                );
              },
              steps: <Step>[
                Step(
                  title: Container(
                    decoration: BoxDecoration(
                        color: Color(0xFF121940),
                        // color: Color(0xFF121940),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Text(
                        'Purpose of Appointment',
                        style: TextStyle(
                            letterSpacing: 1,
                            color: Colors.white,
                            fontFamily: 'sans'),
                      ),
                    ),
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      isPatient
                          ? Text(
                              'Sugar & Blood pressure',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF121940),
                                  fontFamily: 'sans',
                                  fontSize: 20),
                            )
                          : Text(
                              'Waiting for Doctor Response',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF121940),
                                fontFamily: 'sans',
                              ),
                            ),
                      SizedBox(
                        height: 10,
                      ),
                      isPatient
                          ? Text(
                              'I have been feeling high sugar level for some days & my blood pressure is also high in morning.',
                              style: TextStyle(fontFamily: 'sans'),
                            )
                          : Container()
                    ],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 0
                      ? StepState.complete
                      : StepState.disabled,
                ),
                Step(
                  title: Container(
                    decoration: BoxDecoration(
                        color: Color(0xFF121940),
                        // color: Color(0xFF121940),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Text(
                        'Go to Clinic',
                        style: TextStyle(
                            letterSpacing: 1,
                            color: Colors.white,
                            fontFamily: 'sans'),
                      ),
                    ),
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Go to Clinic',
                            style: TextStyle(
                                color: Color(0xFF121940),
                                fontFamily: 'sans',
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          isPatient
                              ? Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    'Patient comming to your clinic',
                                    style: TextStyle(
                                        fontFamily: 'Sans',
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.bold),
                                  ))
                              : Text(
                                  'You have appointment with "Dr Saif " at 16-5-2021, 6 PM, please go to clinic at 5:30 PM, please tap "go to clinic" button, when you leave for doctor',
                                  style: TextStyle(fontFamily: 'sans'),
                                )
                        ],
                      ),

                      // TextFormField(
                      //   decoration:
                      //       InputDecoration(labelText: 'Email Address'),
                      // ),
                      // TextFormField(
                      //   decoration: InputDecoration(labelText: 'Password'),
                      // ),
                    ],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 1
                      ? StepState.complete
                      : StepState.disabled,
                ),
                Step(
                  title: Container(
                    decoration: BoxDecoration(
                        color: Color(0xFF121940),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Text(
                        'Check in Clinic',
                        style: TextStyle(
                            letterSpacing: 1,
                            color: Colors.white,
                            fontFamily: 'sans'),
                      ),
                    ),
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      isPatient
                          ? Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Patient Reached Clinic ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF121940),
                                    fontFamily: 'sans',
                                    fontSize: 20),
                              ),
                            )
                          : Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Reached at Clinic ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF121940),
                                    fontFamily: 'sans',
                                    fontSize: 20),
                              ),
                            ),
                      SizedBox(
                        height: 10,
                      ),
                      isPatient
                          ? Text(
                              '4 minutes ago',
                              style: TextStyle(
                                  fontFamily: 'sans',
                                  fontWeight: FontWeight.bold),
                            )
                          : Text('After reached clinic, press "Reached" button')
                    ],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 2
                      ? StepState.complete
                      : StepState.disabled,
                ),
                Step(
                  title: Container(
                    decoration: BoxDecoration(
                        color: Color(0xFF121940),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Text(
                        "Doctor's Note",
                        style: TextStyle(
                            letterSpacing: 1,
                            color: Colors.white,
                            fontFamily: 'sans'),
                      ),
                    ),
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Meet Patient ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF121940),
                              fontFamily: 'sans',
                              fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Doctor's Prescription",
                        style: TextStyle(
                            color: Color(0xFF121940),
                            fontFamily: 'sans',
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 150.0,
                        alignment: AlignmentDirectional.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(blurRadius: 10.0, color: Colors.black12)
                            ]),
                        padding: EdgeInsets.only(
                            left: 20.0, right: 30.0, top: 0.0, bottom: 0.0),
                        child: TextFormField(
                          minLines: 6,
                          // any number you need (It works as the rows for the textarea)
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration(
                              hintText: 'Enter Detail',
                              border: InputBorder.none,
                              labelStyle: TextStyle(
                                  fontSize: 15.0,
                                  fontFamily: 'Sans',
                                  letterSpacing: 0.3,
                                  color: Colors.grey[200],
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // Stack(
                      //   children: <Widget>[
                      //     Container(
                      //       height: 100,
                      //       width: MediaQuery.of(context).size.width,
                      //       padding: EdgeInsets.all(3),
                      //       decoration: BoxDecoration(
                      //           border: Border.all(color: Color(0xFF121940)),
                      //           borderRadius: BorderRadius.circular(10)),
                      //       // color: Colors.amber,
                      //
                      //       child: _decideImageView(),
                      //     ),
                      //     Positioned(
                      //       top: -10,
                      //       right: 5,
                      //       child: Container(
                      //         child: IconButton(
                      //           icon: Icon(
                      //             Icons.camera_alt,
                      //             color: Color(0xFF121940),
                      //           ),
                      //           onPressed: () {
                      //             showChoiceDialog(context);
                      //           },
                      //         ),
                      //       ),
                      //     )
                      //   ],
                      // )
                    ],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 3
                      ? StepState.complete
                      : StepState.disabled,
                ),
              ],
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.list),
      //   onPressed: switchStepsType,
      // ),
    );
  }

  // switchStepsType() {
  //   setState(() => stepperType == StepperType.vertical
  //       ? stepperType = StepperType.horizontal
  //       : stepperType = StepperType.vertical);
  // }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    print(' current step is $_currentStep');
    _currentStep < 3 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}
