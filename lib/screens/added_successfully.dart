import 'package:dealership/constants.dart';
import 'package:dealership/screens/enquiry1.dart';
import 'package:dealership/screens/enquiry2.dart';
import 'package:dealership/screens/get_started.dart';
import 'package:dealership/screens/home_page.dart';
import 'package:dealership/screens/options.dart';
import 'package:dealership/screens/register_check.dart';
import 'package:flutter/material.dart';

class AddedSuccessfully extends StatefulWidget {
  const AddedSuccessfully({Key? key}) : super(key: key);

  @override
  State<AddedSuccessfully> createState() => _AddedSuccessfullyState();
}

TextEditingController buyingPrice = TextEditingController();

class _AddedSuccessfullyState extends State<AddedSuccessfully> {
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
                    height: _mediaQuery.height / 1.65812356979,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  width: _mediaQuery.width / 1.60944206009,
                                  child: Text(
                                    'Data submitted successfully.',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: roboto,
                                      fontWeight: FontWeight.w400,
                                      fontSize:
                                          _mediaQuery.width / 28.8461538462,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: _mediaQuery.height / 16.5714285714,
                                ),
                                SizedBox(
                                  width: _mediaQuery.width / 1.60944206009,
                                  child: Text(
                                    '12 January 01:00 AM',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: roboto,
                                      fontWeight: FontWeight.w400,
                                      fontSize:
                                          _mediaQuery.width / 28.8461538462,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: _mediaQuery.height / 12.0967741935,
                                ),
                                Button(
                                  mediaQuery: _mediaQuery,
                                  text: 'OKAY',
                                  fillColor: Colors.white,
                                  textColor: blue,
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
