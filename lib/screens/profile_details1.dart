import 'package:dealership/constants.dart';
import 'package:dealership/screens/enquiry2.dart';
import 'package:dealership/screens/options.dart';
import 'package:dealership/screens/profile_details2.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

class ProfileDetails1 extends StatefulWidget {
  const ProfileDetails1({Key? key}) : super(key: key);

  @override
  State<ProfileDetails1> createState() => _ProfileDetails1State();
}

TextEditingController fullNameController = TextEditingController();
TextEditingController departmentController = TextEditingController();
TextEditingController locationController = TextEditingController();
TextEditingController roleController = TextEditingController();
var _dateOfJoining;

var fullNameEM;
var departmentEM;
var locationEM;
var roleEM;
var dateOfJoiningEM;

class _ProfileDetails1State extends State<ProfileDetails1> {
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: _mediaQuery.width / 20.6666666667,
                    top: _mediaQuery.height / 31.2307692308,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: blue,
                      size: _mediaQuery.width / 15,
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(
                    right: _mediaQuery.width / 20.6666666667,
                    top: _mediaQuery.height / 31.2307692308,
                  ),
                  child: Text(
                    '1 / 2',
                    style: TextStyle(
                      color: blue,
                      fontFamily: roboto,
                      fontSize: _mediaQuery.width / 16.3043478261,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: _mediaQuery.height / 50.75,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: _mediaQuery.width / 9.61538461538,
                right: _mediaQuery.width / 13.8888888889,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'build your profile'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontFamily: poppins,
                      fontSize: _mediaQuery.width / 20.8333333333,
                    ),
                  ),
                  Text(
                    'Add Profile Details',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.9),
                      fontFamily: poppins,
                      fontSize: _mediaQuery.width / 12.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: _mediaQuery.height / 36.9090909091,
                  ),
                  TextBox(
                    mediaQuery: _mediaQuery,
                    title: 'Full Name',
                    hint: 'Type full name',
                    controller: fullNameController,
                  ),
                  SizedBox(
                    height: _mediaQuery.height / 81.2,
                  ),
                  TextBox(
                    mediaQuery: _mediaQuery,
                    title: 'Department',
                    hint: 'Type department',
                    controller: departmentController,
                  ),
                  SizedBox(
                    height: _mediaQuery.height / 81.2,
                  ),
                  Text(
                    'Date of Joining',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontFamily: poppins,
                      fontSize: _mediaQuery.width / 23.4375,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      NAlertDialog(
                        content: SizedBox(
                          height: _mediaQuery.height / 2,
                          width: _mediaQuery.width / 1.2,
                          child: ScrollDatePicker(
                            maximumDate: DateTime(2027),
                            options: DatePickerOptions(isLoop: false),
                            onDateTimeChanged: (date) {
                              setState(() {
                                _dateOfJoining = date.toString();
                              });
                            },
                            selectedDate: DateTime.utc(2027),
                          ),
                        ),
                      ).show(context);
                    },
                    child: Container(
                      height: _mediaQuery.height / 13.7627118644,
                      width: _mediaQuery.width / 1.21359223301,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 1, color: blue),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: _mediaQuery.width / 22.0588235294,
                          top: _mediaQuery.height / 67.6666666667,
                          right: _mediaQuery.width / 20.8333333333,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _dateOfJoining == null
                                  ? 'Select date'
                                  : _dateOfJoining,
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontFamily: poppins,
                                fontSize: _mediaQuery.width / 20.8333333333,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.calendar_month_outlined,
                              color: blue,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: _mediaQuery.height / 81.2,
                  ),
                  TextBox(
                    mediaQuery: _mediaQuery,
                    title: 'Role',
                    hint: 'Type role',
                    controller: roleController,
                  ),
                  SizedBox(
                    height: _mediaQuery.height / 81.2,
                  ),
                  TextBox(
                    mediaQuery: _mediaQuery,
                    title: 'Location',
                    hint: 'Type location',
                    controller: locationController,
                  ),
                  SizedBox(
                    height: _mediaQuery.height / 81.2,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: _mediaQuery.height / 34.6060606061,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: _mediaQuery.width / 22.7272727273,
                right: _mediaQuery.width / 22.7272727273,
              ),
              child: Button2(
                mediaQuery: _mediaQuery,
                fill: false,
                title: 'Submit',
                onTapCheck: true,
                onTap: () {
                  setState(() {
                    fullNameEM = fullNameController.text;
                    departmentEM = departmentController.text;
                    locationEM = locationController.text;
                    roleEM = roleController.text;
                    dateOfJoiningEM = _dateOfJoining;
                  });

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfileDetails2()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
