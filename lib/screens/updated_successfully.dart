import 'package:dealership/constants.dart';
import 'package:dealership/screens/employee_home.dart';
import 'package:dealership/screens/enquiry1.dart';
import 'package:dealership/screens/enquiry2.dart';
import 'package:dealership/screens/get_started.dart';
import 'package:dealership/screens/home_page.dart';
import 'package:dealership/screens/options.dart';
import 'package:dealership/screens/register_check.dart';
import 'package:flutter/material.dart';

class UpdatedSuccessfully extends StatefulWidget {
  const UpdatedSuccessfully({Key? key}) : super(key: key);

  @override
  State<UpdatedSuccessfully> createState() => _UpdatedSuccessfullyState();
}

TextEditingController buyingPrice = TextEditingController();

class _UpdatedSuccessfullyState extends State<UpdatedSuccessfully> {
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: _mediaQuery.height / 4.43715847,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: _mediaQuery.width / 12.5,
                      right: _mediaQuery.width / 12.5),
                  child: Container(
                    height: _mediaQuery.height / 2.17112299465,
                    width: _mediaQuery.width / 1.19047619048,
                    decoration: BoxDecoration(
                      color: Color(
                        0xFFFBFBFB,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Spacer(),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.highlight_off,
                                  color: Colors.black.withOpacity(0.31),
                                ))
                          ],
                        ),
                        Center(
                          child: SizedBox(
                            width: _mediaQuery.width / 1.69683257919,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: _mediaQuery.height / 40.6,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: _mediaQuery.height / 8.37113402,
                                      width: _mediaQuery.height / 8.37113402,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Color(0xFF3C8CE7),
                                            Color(0xFF00EAFF),
                                          ],
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.done,
                                        color: Colors.white,
                                        size: _mediaQuery.height / 8.37113402,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: _mediaQuery.height / 23.8823529412,
                                ),
                                Text(
                                  'Done',
                                  style: TextStyle(
                                    color: blue,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: roboto,
                                    fontSize: _mediaQuery.width / 16.9090909091,
                                  ),
                                ),
                                SizedBox(
                                  height: _mediaQuery.height / 26.1935483871,
                                ),
                                SizedBox(
                                  width: _mediaQuery.width / 1.5306122449,
                                  child: Text(
                                    'Profile details submitted successfully.',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: roboto,
                                      fontWeight: FontWeight.w400,
                                      fontSize:
                                          _mediaQuery.width / 28.8461538462,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  height: _mediaQuery.height / 33.8333333333,
                                ),
                                Button(
                                  mediaQuery: _mediaQuery,
                                  text: 'Go back to home',
                                  fillColor: Colors.white,
                                  textColor: blue,
                                  nextScreen: EmployeeHome(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
