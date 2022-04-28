import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dealership/constants.dart';
import 'package:dealership/models/update_emplyee_model.dart';
import 'package:dealership/screens/enquiry2.dart';
import 'package:dealership/screens/evaluation3.dart';
import 'package:dealership/screens/options.dart';
import 'package:dealership/screens/profile_details1.dart';
import 'package:dealership/screens/profile_pic.dart';
import 'package:dealership/screens/updated_successfully.dart';
import 'package:flutter/material.dart';
import 'package:o_popup/o_popup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ProfileDetails2 extends StatefulWidget {
  const ProfileDetails2({Key? key}) : super(key: key);

  @override
  State<ProfileDetails2> createState() => _ProfileDetails2State();
}

TextEditingController salaryController = TextEditingController();

class _ProfileDetails2State extends State<ProfileDetails2> {
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
                      '2 / 2',
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
                      title: 'Salary',
                      hint: 'Enter salary',
                      controller: salaryController,
                    ),
                    SizedBox(
                      height: _mediaQuery.height / 1.94623655914,
                    ),
                  ],
                ),
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
                  onTap: () async {
                    var _sharedPreferences =
                        await SharedPreferences.getInstance();
                    FirebaseFirestore firebaseFirestore =
                        FirebaseFirestore.instance;

                    EmployeeModel employeeModel = EmployeeModel();

                    employeeModel.dateOfJoining = dateOfJoiningEM;
                    employeeModel.department = departmentEM;
                    employeeModel.image = imageURL;
                    employeeModel.location = locationEM;
                    employeeModel.role = roleEM;
                    employeeModel.salary = salaryController.text;
                    employeeModel.fullName = fullNameEM;

                    await firebaseFirestore
                        .collection("users")
                        .doc(_sharedPreferences.getString('uid'))
                        .update(employeeModel.toMap());

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UpdatedSuccessfully()));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
