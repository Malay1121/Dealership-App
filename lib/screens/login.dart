import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dealership/constants.dart';
import 'package:dealership/screens/employee_home.dart';
import 'package:dealership/screens/get_started.dart';
import 'package:dealership/screens/home_page.dart';
import 'package:dealership/screens/verification.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

TextEditingController passwordController = TextEditingController();
TextEditingController usernameController = TextEditingController();

class _LoginState extends State<Login> {
  @override
  void initState() {
    // TODO: implement initState
  }

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
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            color: blue,
                          ),
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.highlight_off,
                              color: blue,
                            ))
                      ],
                    ),
                    Center(
                      child: SizedBox(
                        width: _mediaQuery.width / 1.69683257919,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Log in to continue',
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
                                'Please enter your username and password',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: roboto,
                                  fontWeight: FontWeight.w400,
                                  fontSize: _mediaQuery.width / 28.8461538462,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: _mediaQuery.height / 25.375,
                            ),
                            TextFieldsStart(
                              mediaQuery: _mediaQuery,
                              text: 'Username',
                              controller: usernameController,
                            ),
                            SizedBox(
                              height: _mediaQuery.height / 62.4615384615,
                            ),
                            TextFieldsStart(
                              password: true,
                              mediaQuery: _mediaQuery,
                              text: 'Password',
                              controller: passwordController,
                            ),
                            SizedBox(
                              height: _mediaQuery.height / 18.4545454545,
                            ),
                            Button(
                              mediaQuery: _mediaQuery,
                              text: 'verify',
                              fillColor: Colors.white,
                              textColor: Colors.black,
                              onTapCheck: true,
                              onTap: () async {
                                setState(() {
                                  login = true;
                                });
                                await FirebaseFirestore.instance
                                    .collection('users')
                                    .where('name',
                                        isEqualTo: usernameController.text)
                                    .get()
                                    .then(
                                  (value) {
                                    setState(() {
                                      name = value.docs[0]['name'];
                                      uid = value.docs[0]['uid'];
                                      storage.write(
                                          key: 'uid',
                                          value: value.docs[0]['uid']);
                                      employee = value.docs[0]['employee'];
                                      password = value.docs[0]['password'];
                                    });
                                    storage.write(
                                        value: usernameController.text,
                                        key: 'username');
                                    storage.write(
                                        key: 'password',
                                        value: passwordController.text);
                                    storage.write(
                                      key: 'phone',
                                      value: phone,
                                    );
                                  },
                                );

                                if (usernameController.text == name) {
                                  if (passwordController.text == password) {
                                    if (employee == false) {
                                      print(storage.read(key: 'username'));
                                      print(storage.read(key: 'password'));
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomePage()));
                                    } else {
                                      print(storage.read(key: 'username'));
                                      print(storage.read(key: 'password'));
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EmployeeHome()));
                                    }
                                  } else {
                                    showSnackBar(context,
                                        'Check your username and password and try again!');
                                  }
                                } else {
                                  showSnackBar(context,
                                      'Check your username and password and try again!');
                                }
                              },
                            ),
                            SizedBox(
                              height: _mediaQuery.height / 35.3043478261,
                            ),
                            SizedBox(
                              width: _mediaQuery.width / 1.68325791855,
                              child: Text(
                                ' Forget Password?',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: roboto,
                                  fontSize: _mediaQuery.width / 28.6153846154,
                                ),
                                textAlign: TextAlign.center,
                              ),
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
