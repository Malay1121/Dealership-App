import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dealership/constants.dart';
import 'package:dealership/screens/adding_details2.dart';
import 'package:dealership/screens/employee_home.dart';
import 'package:dealership/screens/get_started.dart';
import 'package:dealership/screens/home_page.dart';
import 'package:dealership/screens/password.dart';
import 'package:dealership/screens/verification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class EnterOTP extends StatefulWidget {
  const EnterOTP({Key? key}) : super(key: key);

  @override
  State<EnterOTP> createState() => _EnterOTPState();
}

TextEditingController otpController = TextEditingController();

class _EnterOTPState extends State<EnterOTP> {
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
                              'Enter OTP',
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
                              child: Row(
                                children: [
                                  Text(
                                    'Please enter OTP sent on',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: roboto,
                                      fontWeight: FontWeight.w400,
                                      fontSize:
                                          _mediaQuery.width / 28.8461538462,
                                    ),
                                  ),
                                  Text(
                                    phone,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: roboto,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          _mediaQuery.width / 28.8461538462,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  rePassword = true;
                                });
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Verification()));
                              },
                              child: Text(
                                'Edit Number',
                                style: TextStyle(
                                  color: blue,
                                  fontFamily: roboto,
                                  fontWeight: FontWeight.w400,
                                  fontSize: _mediaQuery.width / 28.8461538462,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: _mediaQuery.height / 40.6,
                            ),
                            TextFieldsStart(
                              mediaQuery: _mediaQuery,
                              text: 'Enter OTP',
                              controller: otpController,
                            ),
                            SizedBox(
                              height: _mediaQuery.height / 26.1935483871,
                            ),
                            SizedBox(
                              width: _mediaQuery.width / 1.60944206009,
                              child: Text(
                                'Didn’t recieved OTP?',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: roboto,
                                  fontWeight: FontWeight.w400,
                                  fontSize: _mediaQuery.width / 28.8461538462,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                verifyPhoneNumber(phone, context, setData);
                              },
                              child: Text(
                                'Resend OTP',
                                style: TextStyle(
                                  color: blue,
                                  fontFamily: roboto,
                                  fontWeight: FontWeight.w400,
                                  fontSize: _mediaQuery.width / 28.8461538462,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: _mediaQuery.height / 23.2,
                            ),
                            Button(
                              mediaQuery: _mediaQuery,
                              text: 'Confirm',
                              fillColor: Colors.white,
                              textColor: Colors.black,
                              onTapCheck: true,
                              onTap: () async {
                                signInWithPhoneNumber(verificationID,
                                    otpController.text, context);
                              },
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
              bigColor: Color(0xFF4F4F4F),
              smallColor: Color(0xFF004D66),
            ),
          ],
        ),
      ),
    );
  }

  void setData(verifcationId) {
    setState(() {
      verificationID = verifcationId;
    });
  }
}

Future<void> signInWithPhoneNumber(
    String verificationId, String smsCode, BuildContext context) async {
  AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId, smsCode: smsCode);

  UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);
  Navigator.push(context, MaterialPageRoute(builder: (context) => Password()));
}
