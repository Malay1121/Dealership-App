import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dealership/constants.dart';
import 'package:dealership/screens/calling_analysis1.dart';
import 'package:dealership/screens/employee_home.dart';
import '../main.dart';
import 'enquiry2.dart';
import 'package:dealership/screens/options.dart';
import 'package:flutter/material.dart';

class CallingAnalysis3 extends StatefulWidget {
  const CallingAnalysis3({Key? key}) : super(key: key);

  @override
  State<CallingAnalysis3> createState() => _CallingAnalysis3State();
}

String customerType = 'Select type';
String remark = 'Select remark';

TextEditingController evaluationDoneNotBuyingController =
    TextEditingController();
TextEditingController otherRemarkFromEvaluatorController =
    TextEditingController();
TextEditingController callDoneController = TextEditingController();

class _CallingAnalysis3State extends State<CallingAnalysis3> {
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
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
                    '3 / 3',
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
                    'Calling Info Update'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontFamily: poppins,
                      fontSize: _mediaQuery.width / 20.8333333333,
                    ),
                  ),
                  Text(
                    'Add Calling Data',
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
                  Text(
                    'Type of customer',
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
                        value: customerType,
                        iconSize: 24,
                        hint: Text(
                          'Select type',
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
                            customerType = newValue!;
                          });
                        },
                        items: <String>[
                          'Select type',
                          'Exchange Done',
                          'First Time',
                          'Additional'
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
                    title: 'Evaluation done but not buying',
                    hint: 'Type details',
                    controller: evaluationDoneNotBuyingController,
                  ),
                  SizedBox(
                    height: _mediaQuery.height / 81.2,
                  ),
                  Text(
                    'Remark if ‘Not buying’',
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
                        value: remark,
                        iconSize: 24,
                        hint: Text(
                          'Select Remark',
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
                            remark = newValue!;
                          });
                        },
                        items: <String>[
                          'High Expected',
                          'Two',
                          'Accidental Car',
                          'Document Problem',
                          'Accounting Problem',
                          'Owner Problem',
                          'Illegal Demand'
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
                    title: 'Other remark from evaluator',
                    hint: 'Type car model',
                    controller: otherRemarkFromEvaluatorController,
                  ),
                  SizedBox(
                    height: _mediaQuery.height / 81.2,
                  ),
                  TextBox(
                    mediaQuery: _mediaQuery,
                    title: 'Call Done',
                    hint: 'Select option',
                    controller: callDoneController,
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
                fill: true,
                title: 'Submit',
                onTapCheck: true,
                onTap: () async {
                  var _uid = await storage.read(key: 'uid');
                  setState(() {
                    callingAnalysisModel.typeOfCustomer2 = customerType;
                    callingAnalysisModel.evaluationDoneNotBuying =
                        evaluationDoneNotBuyingController.text;
                    callingAnalysisModel.remarkIfNo = remark;
                    callingAnalysisModel.remarkFromEvaluator =
                        otherRemarkFromEvaluatorController.text;
                    callingAnalysisModel.callDone2 = callDoneController.text;
                    callingAnalysisModel.uid = _uid;
                  });

                  FirebaseFirestore.instance
                      .collection('Calling Analysis')
                      .doc('${_uid}${callingAnalysisModel.newCarModel}')
                      .set(callingAnalysisModel.toMap())
                      .then((value) => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EmployeeHome())));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
