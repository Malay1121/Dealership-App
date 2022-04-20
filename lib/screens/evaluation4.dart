import 'package:dealership/constants.dart';
import 'package:dealership/screens/get_started.dart';
import 'enquiry2.dart';
import 'package:dealership/screens/options.dart';
import 'package:flutter/material.dart';

import 'buying1.dart';

class Enquiry6 extends StatefulWidget {
  const Enquiry6({Key? key}) : super(key: key);

  @override
  State<Enquiry6> createState() => _Enquiry6State();
}

String _evaluationDone = 'Select Option';
String _interestedInExchange = 'Select Option';
String _exchangeDealClosed = 'Select Option';
String _remarkIfNo = 'Select Option';

TextEditingController evaluatorController = TextEditingController();

class _Enquiry6State extends State<Enquiry6> {
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
                      '6 / 10',
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
                      'Enquiry Info Update'.toUpperCase(),
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontFamily: poppins,
                        fontSize: _mediaQuery.width / 20.8333333333,
                      ),
                    ),
                    Text(
                      'Add Evaluation',
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
                    Row(
                      children: [
                        Text(
                          'Evaluation done',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontFamily: poppins,
                            fontSize: _mediaQuery.width / 23.4375,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '*Required',
                          style: TextStyle(
                            color: blue,
                            fontFamily: poppins,
                            fontSize: _mediaQuery.width / 31.2,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
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
                        ),
                        child: DropdownButton<String>(
                          iconEnabledColor: Color(0xFF06ADFE),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: blue,
                          ),
                          value: _evaluationDone,
                          iconSize: 24,
                          hint: Text(
                            'Type mobile number',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontFamily: poppins,
                              fontSize: _mediaQuery.width / 20.8333333333,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          underline: SizedBox(),
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontFamily: poppins,
                            fontSize: _mediaQuery.width / 20.8333333333,
                            fontWeight: FontWeight.w500,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              _evaluationDone = newValue!;
                            });
                          },
                          items: <String>['Select Option', 'Yes', 'No']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: _mediaQuery.height / 81.2,
                    ),
                    Text(
                      'Intrested in exchange',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontFamily: poppins,
                        fontSize: _mediaQuery.width / 23.4375,
                        fontWeight: FontWeight.w500,
                      ),
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
                        ),
                        child: DropdownButton<String>(
                          iconEnabledColor: Color(0xFF06ADFE),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: blue,
                          ),
                          value: _interestedInExchange,
                          iconSize: 24,
                          hint: Text(
                            'Type source',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontFamily: poppins,
                              fontSize: _mediaQuery.width / 20.8333333333,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          underline: SizedBox(),
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontFamily: poppins,
                            fontSize: _mediaQuery.width / 20.8333333333,
                            fontWeight: FontWeight.w500,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              _interestedInExchange = newValue!;
                            });
                          },
                          items: <String>['Select Option', 'Yes', 'No']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: _mediaQuery.height / 81.2,
                    ),
                    Text(
                      'Exchange deal closed',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontFamily: poppins,
                        fontSize: _mediaQuery.width / 23.4375,
                        fontWeight: FontWeight.w500,
                      ),
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
                        ),
                        child: DropdownButton<String>(
                          iconEnabledColor: Color(0xFF06ADFE),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: blue,
                          ),
                          value: _exchangeDealClosed,
                          iconSize: 24,
                          hint: Text(
                            'Select condition',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontFamily: poppins,
                              fontSize: _mediaQuery.width / 20.8333333333,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          underline: SizedBox(),
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontFamily: poppins,
                            fontSize: _mediaQuery.width / 20.8333333333,
                            fontWeight: FontWeight.w500,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              _exchangeDealClosed = newValue!;
                            });
                          },
                          items: <String>['Select Option', 'Yes', 'No']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: _mediaQuery.height / 81.2,
                    ),
                    Text(
                      'Remark if no',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontFamily: poppins,
                        fontSize: _mediaQuery.width / 23.4375,
                        fontWeight: FontWeight.w500,
                      ),
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
                        ),
                        child: DropdownButton<String>(
                          iconEnabledColor: Color(0xFF06ADFE),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: blue,
                          ),
                          value: _remarkIfNo,
                          iconSize: 24,
                          hint: Text(
                            'Type team leader name',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontFamily: poppins,
                              fontSize: _mediaQuery.width / 20.8333333333,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          underline: SizedBox(),
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontFamily: poppins,
                            fontSize: _mediaQuery.width / 20.8333333333,
                            fontWeight: FontWeight.w500,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              _remarkIfNo = newValue!;
                            });
                          },
                          items: <String>[
                            'Select Option',
                            'High EXP',
                            'Not as per Noms',
                            'Accident',
                            'Owner Problem',
                            'Accounting Problem',
                            'Unwanted Demand',
                            'Other'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: _mediaQuery.height / 81.2,
                    ),
                    TextBox(
                      mediaQuery: _mediaQuery,
                      title: 'Evaluator',
                      hint: 'Type evaluator name',
                      controller: evaluatorController,
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
                    if (_evaluationDone != 'Select Option') {
                      evaluationDone = _evaluationDone;
                      interestedInExchange = _interestedInExchange;
                      exchangeDealClosed = _exchangeDealClosed;
                      remarkIfNo = _remarkIfNo;
                      evaluator = evaluatorController.text;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Enquiry7()));
                    } else {
                      showSnackBar(
                          context, 'Please fill required fields to continue!');
                    }
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
