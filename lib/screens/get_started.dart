import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dealership/constants.dart';
import 'package:dealership/screens/login.dart';
import 'package:dealership/screens/verification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'employee_home.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();
}

var _auth = FirebaseAuth.instance;

class _GetStartedState extends State<GetStarted> {
  Future<void> shared() async {
    shared(BuildContext context) async {
      await Permission.storage.request();
      var _sharedPreferences = await SharedPreferences.getInstance();

      await FirebaseFirestore.instance
          .collection('users')
          .where('name', isEqualTo: _sharedPreferences.getString('username'))
          .get()
          .then((value) => {
                name = value.docs[0]['name'],
                password = value.docs[0]['password'],
                phone = value.docs[0]['phone'],
                uid = value.docs[0]['uid'],
                if (_sharedPreferences.getString('username') ==
                    value.docs[0]['name'])
                  {
                    if (_sharedPreferences.getString('password') ==
                        value.docs[0]['password'])
                      {
                        setState(() {
                          employee = value.docs[0]['employee'] == null
                              ? false
                              : value.docs[0]['employee'];
                        }),
                        WidgetsBinding.instance?.addPostFrameCallback((_) {
                          if (employee == false) {
                            setState(() {
                              home = true;
                            });
                          } else {
                            setState(() {
                              employeeHome = true;
                            });
                          }
                        }),
                      }
                  }
              });
    }

    await shared(context);
  }

  @override
  void initState() {
    super.initState();
    shared();
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
                    Center(
                      child: Container(
                        height: _mediaQuery.height / 6.41238253,
                        width: _mediaQuery.width / 2.24550898,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/get_started.png'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: _mediaQuery.height / 29.6675192,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: _mediaQuery.width / 8.33333333333,
                      ),
                      child: Text(
                        'Easy',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontFamily: roboto,
                          fontSize: _mediaQuery.width / 13.3928571429,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: _mediaQuery.width / 1.19047619048,
                      child: Column(
                        children: [
                          SizedBox(
                            height: _mediaQuery.height / 26.1935483871,
                          ),
                          SizedBox(
                            width: _mediaQuery.width / 1.60944206009,
                            child: Text(
                              'Get started by signing up or just log in if you are a existing user.',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: roboto,
                                fontWeight: FontWeight.w400,
                                fontSize: _mediaQuery.width / 25,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: _mediaQuery.height / 27.0666666667,
                          ),
                          Button(
                            nextScreen: Verification(),
                            mediaQuery: _mediaQuery,
                            text: 'sign up',
                            fillColor: Colors.white,
                            textColor: Color(0xFF0177C1),
                          ),
                          SizedBox(
                            height: _mediaQuery.height / 62.4615384615,
                          ),
                          GestureDetector(
                            onTap: () async {
                              // var _sharedPreferences =
                              //     await SharedPreferences.getInstance();

                              // FirebaseFirestore.instance
                              //     .collection('users')
                              //     .where('name',
                              //         isEqualTo: _sharedPreferences
                              //             .getString('username'))
                              //     .get()
                              //     .then((value) => {
                              //           name = value.docs[0]['name'],
                              //           password = value.docs[0]['password'],
                              //           phone = value.docs[0]['phone'],
                              //           uid = value.docs[0]['uid'],
                              //           if (_sharedPreferences
                              //                   .getString('username') ==
                              //               value.docs[0]['name'])
                              //             {
                              //               if (_sharedPreferences
                              //                       .getString('password') ==
                              //                   value.docs[0]['password'])
                              //                 {
                              //                   setState(() {
                              //                     employee = value.docs[0]
                              //                                 ['employee'] ==
                              //                             null
                              //                         ? false
                              //                         : value.docs[0]
                              //                             ['employee'];
                              //                   }),
                              //                   Timer.run(() {
                              //                     (_) {
                              //                       employee == false
                              //                           ? Navigator.push(
                              //                               context,
                              //                               MaterialPageRoute(
                              //                                   builder:
                              //                                       (context) =>
                              //                                           HomePage()))
                              //                           : Navigator.push(
                              //                               context,
                              //                               MaterialPageRoute(
                              //                                   builder:
                              //                                       (context) =>
                              //                                           EmployeeHome()));
                              //                     };
                              //                   }),
                              //                 }
                              //               else
                              //                 {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                              //                 }
                              //             }
                              //         });
                              // await FirebaseFirestore.instance
                              //     .collection('users')
                              //     .where(
                              //       'uid',
                              //       isEqualTo:
                              //           _sharedPreferences.getString('uid'),
                              //     )
                              //     .get()
                              //     .then(
                              //       (value) => {
                              //         employee = value.docs[0]['employee'],
                              //       },
                              //     );
                            },
                            child: Text(
                              'Log in'.toUpperCase(),
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontFamily: roboto,
                                fontSize: _mediaQuery.width / 26.7857142857,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: _mediaQuery.height / 81.2,
                          ),
                          SizedBox(
                            width: _mediaQuery.width / 1.69683257919,
                            child: Text(
                              'It will take 10 seconds for sign up.',
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
                  ],
                ),
              ),
            ),
            SliderPage(
              mediaQuery: _mediaQuery,
              bigColor: Color(0xFFB4B4B4),
              smallColor: Color(0xFF6CBAD2),
            ),
          ],
        ),
      ),
    );
  }
}
// void signUp(String email, String password) async {
//     await _auth
//         .createUserWithEmailAndPassword(email: email, password: password)
//         .then((value) => {
//               postDetailsToFirestore(),
//             });
//   }

//   postDetailsToFirestore() async {
//     FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//     User? user = _auth.currentUser;

//     UserModel userModel = UserModel();

//     userModel.email = user!.email;
//     userModel.phone = phoneController.text;
//     userModel.uid = user.uid;
//     userModel.username = usernameController.text;

//     await firebaseFirestore
//         .collection("buyers")
//         .doc(user.uid)
//         .set(userModel.toMap());

//     await firebaseFirestore
//         .collection(sellerCheck == true ? "sellers" : 'buyers')
//         .doc(user.uid)
//         .collection('cart')
//         .add({'product': ''});

//     Navigator.pushAndRemoveUntil(context,
//         MaterialPageRoute(builder: (context) => Redirect()), (route) => false);
//   }
// }

Future<void> verifyPhoneNumber(
    String phoneNumber, BuildContext context, Function setData) async {
  PhoneVerificationCompleted verificationCompleted =
      (PhoneAuthCredential) async {
    showSnackBar(context, 'Verification Completed');
  };

  PhoneVerificationFailed verificationFailed =
      (FirebaseAuthException exception) {
    showSnackBar(context, exception.toString());
  };

  PhoneCodeSent codeSent =
      (String verificationID, [int? forceResecnding]) async {
    showSnackBar(context, 'OTP Code sent to $phoneNumber');
    setData(verificationID);
  };

  PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
      (String verificationID) {
    showSnackBar(context, 'Time Out');
  };

  try {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  } catch (e) {
    showSnackBar(context, e.toString());
  }
}

void showSnackBar(BuildContext context, String text) {
  final snackBar = SnackBar(content: Text(text));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

class Button extends StatefulWidget {
  final Size _mediaQuery;
  final String text;
  final Color fillColor;
  final Color textColor;
  final nextScreen;
  final bool register;
  final bool onTapCheck;
  final onTap;

  const Button({
    Key? key,
    required Size mediaQuery,
    required this.text,
    required this.fillColor,
    required this.textColor,
    this.nextScreen,
    this.register = false,
    this.onTap,
    this.onTapCheck = false,
  })  : _mediaQuery = mediaQuery,
        super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTapCheck == true
          ? widget.onTap
          : () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => widget.nextScreen));
              // widget.register);
            },
      child: Container(
        width: widget._mediaQuery.width / 1.69683257919,
        height: widget._mediaQuery.height / 18.4545454545,
        decoration: BoxDecoration(
          color: widget.fillColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Color(0xFF3278CF),
          ),
        ),
        child: Center(
          child: Text(
            widget.text.toUpperCase(),
            style: TextStyle(
              color: widget.textColor,
              fontFamily: roboto,
              fontWeight: FontWeight.w400,
              fontSize: widget._mediaQuery.width / 26.7857142857,
            ),
          ),
        ),
      ),
    );
  }
}

class SliderPage extends StatelessWidget {
  const SliderPage({
    Key? key,
    required Size mediaQuery,
    required this.bigColor,
    required this.smallColor,
  })  : _mediaQuery = mediaQuery,
        super(key: key);

  final Size _mediaQuery;
  final Color bigColor;
  final Color smallColor;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _mediaQuery.width / 8.33333333333,
      top: _mediaQuery.height / 1.23780487805,
      child: Row(
        children: [
          Container(
            height: 7,
            width: _mediaQuery.width / 13.8888888889,
            decoration: BoxDecoration(
              color: bigColor,
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            height: _mediaQuery.height / 101.5,
            width: _mediaQuery.width / 46.875,
            decoration: BoxDecoration(
              color: smallColor,
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        ],
      ),
    );
  }
}
