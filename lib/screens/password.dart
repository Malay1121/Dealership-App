import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dealership/constants.dart';
import 'package:dealership/models/update_emplyee_model.dart';
import 'package:dealership/models/user.dart';
import 'package:dealership/screens/employee_home.dart';
import 'package:dealership/screens/get_started.dart';
import 'package:dealership/screens/home_page.dart';
import 'package:dealership/screens/login.dart';
import 'package:dealership/screens/verification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class Password extends StatefulWidget {
  const Password({Key? key}) : super(key: key);

  @override
  State<Password> createState() => _PasswordState();
}

TextEditingController passwordController = TextEditingController();
TextEditingController rePasswordController = TextEditingController();

class _PasswordState extends State<Password> {
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: _mediaQuery.height,
              width: _mediaQuery.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/background.png'),
                ),
              ),
            ),
            Positioned(
              top: _mediaQuery.height / 4.43715846995,
              left: _mediaQuery.width / 12.5,
              right: _mediaQuery.width / 12.5,
              child: Container(
                height: _mediaQuery.height / 1.85812356979,
                width: _mediaQuery.width / 1.19047619048,
                decoration: BoxDecoration(
                  color: Color(
                    0xFFFBFBFB,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SizedBox(
                        width: _mediaQuery.width / 1.69683257919,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: _mediaQuery.height / 20.3,
                            ),
                            Text(
                              'Create a password',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontFamily: roboto,
                                fontSize: _mediaQuery.width / 16.9090909091,
                              ),
                            ),
                            SizedBox(
                              height: _mediaQuery.height / 101.5,
                            ),
                            SizedBox(
                              width: _mediaQuery.width / 1.60944206009,
                              child: Text(
                                'Please set a password ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: roboto,
                                  fontWeight: FontWeight.w400,
                                  fontSize: _mediaQuery.width / 28.8461538462,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: _mediaQuery.height / 17.2765957447,
                            ),
                            TextFieldsStart(
                              password: true,
                              mediaQuery: _mediaQuery,
                              text: 'Password',
                              controller: passwordController,
                            ),
                            SizedBox(
                              height: _mediaQuery.height / 62.4615384615,
                            ),
                            TextFieldsStart(
                              password: true,
                              mediaQuery: _mediaQuery,
                              text: 'Confirm Password',
                              controller: rePasswordController,
                            ),
                            SizedBox(
                              height: _mediaQuery.height / 18.4545454545,
                            ),
                            Button(
                              mediaQuery: _mediaQuery,
                              text: 'Create Password',
                              fillColor: Colors.white,
                              textColor: Colors.black,
                              onTapCheck: true,
                              onTap: () async {
                                if (passwordController.text ==
                                    rePasswordController.text) {
                                  setState(() {
                                    password = passwordController.text;
                                  });
                                  storage.write(
                                      key: 'password',
                                      value: passwordController.text);
                                  storage.write(key: 'username', value: name);
                                  setState(() {
                                    login = false;
                                  });

                                  UserModel userModel = UserModel();

                                  userModel.date = date;
                                  userModel.department = department;
                                  userModel.location = location;
                                  userModel.name = name;
                                  userModel.password = password;
                                  userModel.phone = phone;
                                  userModel.role = role;
                                  userModel.salary = salary;
                                  userModel.uid =
                                      FirebaseAuth.instance.currentUser!.uid;
                                  userModel.youAreA = youAreA;
                                  userModel.employee =
                                      youAreA == 'Employee' ? true : false;

                                  EmployeeModel employeeModel = EmployeeModel();

                                  employeeModel.dateOfJoining = '';
                                  employeeModel.department = '';
                                  employeeModel.fullName = '';
                                  employeeModel.image = '';
                                  employeeModel.location = '';
                                  employeeModel.role = '';
                                  employeeModel.salary = '';

                                  print(youAreA);
                                  print(employee);
                                  await FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(FirebaseAuth
                                          .instance.currentUser!.uid)
                                      .set(userModel.toMap());
                                  await FirebaseFirestore.instance
                                      .collection('users')
                                      .where('uid',
                                          isEqualTo: FirebaseAuth
                                              .instance.currentUser!.uid)
                                      .get()
                                      .then(
                                        (value) => {
                                          employee = value.docs[0]['employee'],
                                          storage.write(
                                              key: 'uid',
                                              value: value.docs[0]['uid']),
                                          storage.write(
                                              key: 'phone',
                                              value: value.docs[0]['phone']),
                                        },
                                      );
                                  if (employee == true) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EmployeeHome()));
                                  } else {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()));
                                  }
                                } else {
                                  showSnackBar(
                                      context, 'Password Doesn\'t Match!');
                                }
                              },
                            ),
                            SizedBox(
                              height: _mediaQuery.height / 62.4615384615,
                            ),
                            SizedBox(
                              height: _mediaQuery.height / 81.2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliderPage(
              mediaQuery: _mediaQuery,
              bigColor: Color(0xFFB4B4B4),
              smallColor: Color(0xFFB4B4B499).withOpacity(0.6),
            ),
          ],
        ),
      ),
    );
  }
}
