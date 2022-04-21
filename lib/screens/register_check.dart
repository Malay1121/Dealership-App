import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dealership/column_builder.dart';
import 'package:dealership/constants.dart';
import 'package:dealership/screens/employee_data.dart';
import 'package:dealership/screens/employee_home.dart';
import 'package:dealership/screens/get_started.dart';
import 'package:dealership/screens/home_page.dart';
import 'package:dealership/screens/options.dart';
import 'package:dealership/screens/selling_details.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pdf/widgets.dart' as pw;

var registeration;

class RegisterCheck extends StatefulWidget {
  const RegisterCheck({Key? key}) : super(key: key);

  @override
  State<RegisterCheck> createState() => _RegisterCheckState();
}

TextEditingController numberController = TextEditingController();

SharedPreferences _sharedPreferences = sharedPreferences;

class _RegisterCheckState extends State<RegisterCheck> {
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  bool enabled = false;
  final pdf = pw.Document();

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: _mediaQuery.width / 9.53846153846,
                right: _mediaQuery.width / 13.7777777778,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: _mediaQuery.height / 5.30718954248,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: _mediaQuery.width / 1.45766423358,
                        child: Text(
                          'Please enter registration number',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.66),
                            fontFamily: roboto,
                            fontSize: _mediaQuery.width / 16.1739130435,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.highlight_off,
                          color: blue,
                          size: _mediaQuery.width / 14.88,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: _mediaQuery.height / 8.0396039604,
                  ),
                  Container(
                    height: _mediaQuery.height / 13.7627118644,
                    width: _mediaQuery.width / 1.21359223301,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 1, color: blue)),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: _mediaQuery.width / 22.0588235294,
                        top: _mediaQuery.height / 31.6666666667,
                      ),
                      child: TextField(
                        controller: numberController,
                        decoration: InputDecoration(
                          hintText: '0AA000A',
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontFamily: poppins,
                            fontSize: _mediaQuery.width / 20.8333333333,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontFamily: poppins,
                          fontSize: _mediaQuery.width / 20.8333333333,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: _mediaQuery.height / 31.2307692308,
                  ),
                  SizedBox(
                    width: _mediaQuery.width / 1.21359223301,
                    height: _mediaQuery.height / 18.4545454545,
                    child: RichText(
                      text: TextSpan(
                        text: 'Vehicle available to the list, Please tap on ',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: roboto,
                          fontSize: _mediaQuery.width / 25,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: 'Proceed',
                            style: TextStyle(
                              color: blue,
                            ),
                          ),
                          TextSpan(
                            text: ' to get started.',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: _mediaQuery.height / 3.41324324324,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: _mediaQuery.width / 20,
                right: _mediaQuery.width / 20,
              ),
              child: Button2(
                mediaQuery: _mediaQuery,
                fill: true,
                title: 'Proceed',
                onTapCheck: true,
                onTap: () async {
                  var _sharedPreferences =
                      await SharedPreferences.getInstance();
                  var documentId;
                  await FirebaseFirestore.instance
                      .collection('cars')
                      .where('registerationNumber',
                          isEqualTo: numberController.text)
                      .get()
                      .then((value) async {
                    if (value.docChanges.isEmpty) {
                      showSnackBar(context,
                          'Wrong Registeration Number. Please try again later!');
                    } else {
                      setState(() {
                        registeration = numberController.text;
                      });
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SellingDetails()));
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuySell2 extends StatefulWidget {
  const BuySell2({
    required Size mediaQuery,
    required this.title,
    required this.onTap,
    required this.toggle,
  }) : _mediaQuery = mediaQuery;
  final Size _mediaQuery;
  final String title;
  final VoidCallback onTap;
  final bool toggle;

  @override
  State<BuySell2> createState() => _BuySell2State();
}

class _BuySell2State extends State<BuySell2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: widget.onTap,
          child: Container(
            width: widget._mediaQuery.width / 1.20388349515,
            height: widget._mediaQuery.height / 13.7627118644,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  width: 1,
                  color: widget.toggle == true ? blue : Color(0xFFA2A2A2)),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: widget._mediaQuery.width / 15.5,
                right: widget._mediaQuery.width / 33.8181818182,
              ),
              child: Row(
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      color: blue,
                      fontFamily: roboto,
                      fontSize: widget._mediaQuery.width / 16.1739130435,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  widget.toggle == true
                      ? Icon(Icons.check_circle_outline)
                      : SizedBox(),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: widget._mediaQuery.height / 67.6666666667,
        ),
      ],
    );
  }
}
