import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dealership/constants.dart';
import 'package:dealership/screens/adding_details.dart';
import 'package:dealership/screens/enter_otp.dart';
import 'package:dealership/screens/get_started.dart';
import 'package:dealership/screens/login.dart';
import 'package:flutter/material.dart';

class Verification extends StatefulWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

TextEditingController phoneController = TextEditingController();
TextEditingController nameController = TextEditingController();
String rank = 'You Are A';
String verificationID = '';
String smsCode = '';

class _VerificationState extends State<Verification> {
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
                              'Verification',
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
                                'Please enter your phone number and we will create account for you.',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: roboto,
                                  fontWeight: FontWeight.w400,
                                  fontSize: _mediaQuery.width / 28.8461538462,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: _mediaQuery.height / 90.2222222222,
                            ),
                            TextFieldsStart(
                              mediaQuery: _mediaQuery,
                              text: 'Username',
                              controller: nameController,
                            ),
                            SizedBox(
                              height: _mediaQuery.height / 62.4615384615,
                            ),
                            Container(
                              height: _mediaQuery.height / 21.3684210526,
                              width: _mediaQuery.width / 1.69683257919,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: blue.withOpacity(0.1),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: _mediaQuery.width / 12.5,
                                  ),
                                  Text(
                                    '+91',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: roboto,
                                      fontSize:
                                          _mediaQuery.width / 26.7857142857,
                                    ),
                                  ),
                                  Center(
                                    child: SizedBox(
                                      width: _mediaQuery.width / 2.5,
                                      height: _mediaQuery.height / 21.3684211,
                                      child: TextField(
                                        textAlignVertical:
                                            TextAlignVertical.top,
                                        controller: phoneController,
                                        decoration: InputDecoration(
                                          counterText: '',
                                          labelStyle: TextStyle(
                                            color: Colors.black,
                                            fontFamily: roboto,
                                            fontSize: _mediaQuery.width /
                                                26.7857142857,
                                          ),
                                          border: InputBorder.none,
                                          hintText: '',
                                          hintStyle: TextStyle(
                                            color: Colors.black,
                                            fontFamily: roboto,
                                            fontSize: _mediaQuery.width /
                                                26.7857142857,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: _mediaQuery.height / 62.4615384615,
                            ),
                            Container(
                              height: _mediaQuery.height / 21.3684210526,
                              width: _mediaQuery.width / 1.69683257919,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: blue.withOpacity(0.1),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: _mediaQuery.width / 12.5,
                                ),
                                child: DropdownButton<String>(
                                  iconEnabledColor: Color(0xFF06ADFE),
                                  value: rank,
                                  underline: SizedBox(),
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                  ),
                                  iconSize: 24,
                                  elevation: 16,
                                  hint: Text(
                                    'You Are A',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: roboto,
                                      fontSize: _mediaQuery.width / 26.7142857,
                                    ),
                                  ),
                                  style: const TextStyle(color: Colors.black),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      rank = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    'You Are A',
                                    'Employee',
                                    'Manager',
                                    'Other'
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: _mediaQuery.height / 42.7368421053,
                            ),
                            Button(
                              mediaQuery: _mediaQuery,
                              text: 'Get Code',
                              fillColor: Color(0xFF0D96FE),
                              textColor: Colors.white,
                              nextScreen: AddingDetails(),
                              onTapCheck: true,
                              onTap: () async {
                                await FirebaseFirestore.instance
                                    .collection('users')
                                    .where('name',
                                        isEqualTo: nameController.text)
                                    .get()
                                    .then(
                                      (value) => {
                                        if (value.docs.isEmpty)
                                          {
                                            setState(() {
                                              phone =
                                                  '+91 ${phoneController.text}';
                                              name = nameController.text;
                                              youAreA = rank;
                                            }),
                                            rePassword == true
                                                ? verifyPhoneNumber(
                                                    phone, context, setData)
                                                : null,
                                            rePassword == true
                                                ? Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            EnterOTP()))
                                                : Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            AddingDetails())),
                                          }
                                        else
                                          {
                                            showSnackBar(context,
                                                'Username is already taken')
                                          },
                                      },
                                    );
                              },
                            ),
                            SizedBox(
                              height: _mediaQuery.height / 62.4615384615,
                            ),
                            SizedBox(
                              height: _mediaQuery.height / 81.2,
                            ),
                            SizedBox(
                              width: _mediaQuery.width / 1.69683257919,
                              child: Text(
                                'We will send you an SMS with a confirmation code.',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: roboto,
                                  fontWeight: FontWeight.w400,
                                  fontSize: _mediaQuery.width / 28.8461538462,
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

class TextFieldsStart extends StatelessWidget {
  const TextFieldsStart({
    Key? key,
    required Size mediaQuery,
    required this.text,
    required this.controller,
    this.password = false,
  })  : _mediaQuery = mediaQuery,
        super(key: key);

  final Size _mediaQuery;
  final String text;
  final TextEditingController controller;
  final bool password;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _mediaQuery.height / 21.3684210526,
      width: _mediaQuery.width / 1.69683257919,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: blue.withOpacity(0.1),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: _mediaQuery.width / 12.5,
        ),
        child: TextField(
          obscureText: password == true ? true : false,
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: text,
            hintStyle: TextStyle(
              color: Colors.black,
              fontFamily: roboto,
              fontSize: _mediaQuery.width / 26.7857142857,
            ),
          ),
        ),
      ),
    );
  }
}
