import 'package:dealership/constants.dart';
import 'package:dealership/screens/calling_analysis1.dart';
import 'package:dealership/screens/calling_analysis3.dart';
import 'enquiry2.dart';
import 'package:dealership/screens/evaluation4.dart';
import 'package:dealership/screens/options.dart';
import 'package:flutter/material.dart';

class CallingAnalysis2 extends StatefulWidget {
  const CallingAnalysis2({Key? key}) : super(key: key);

  @override
  State<CallingAnalysis2> createState() => _CallingAnalysis2State();
}

String callDone = 'Yes';
String remark = 'Yes';

TextEditingController consultant = TextEditingController();
TextEditingController _teamLeader = TextEditingController();
TextEditingController evaluator = TextEditingController();
TextEditingController newCarModel = TextEditingController();

class _CallingAnalysis2State extends State<CallingAnalysis2> {
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: ListView(
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
                    '2 / 3',
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
                  TextBox(
                    mediaQuery: _mediaQuery,
                    title: 'Consultant',
                    hint: 'Type consultant name',
                    controller: consultant,
                  ),
                  SizedBox(
                    height: _mediaQuery.height / 81.2,
                  ),
                  TextBox(
                    mediaQuery: _mediaQuery,
                    title: 'Team Leader',
                    hint: 'Type team leader name',
                    controller: _teamLeader,
                  ),
                  SizedBox(
                    height: _mediaQuery.height / 81.2,
                  ),
                  TextBox(
                    mediaQuery: _mediaQuery,
                    title: 'Evaluator',
                    hint: 'Type evaluator name',
                    controller: evaluator,
                  ),
                  SizedBox(
                    height: _mediaQuery.height / 81.2,
                  ),
                  TextBox(
                    mediaQuery: _mediaQuery,
                    title: 'New Car Model',
                    hint: 'Type car model',
                    controller: newCarModel,
                  ),
                  SizedBox(
                    height: _mediaQuery.height / 81.2,
                  ),
                  Text(
                    'Call Done',
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
                        value: callDone,
                        iconSize: 24,
                        hint: Text(
                          'Select option',
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
                            callDone = newValue!;
                          });
                        },
                        items: <String>[
                          'Yes',
                          'No',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  callDone == 'No'
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Remark',
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
                                    'Select option',
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.6),
                                      fontFamily: poppins,
                                      fontSize:
                                          _mediaQuery.width / 20.8333333333,
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
                                    'Yes',
                                    'No',
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
                          ],
                        )
                      : SizedBox(),
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
                  setState(() {
                    callingAnalysisModel.consultant = consultantController.text;
                    callingAnalysisModel.teamLeader = teamLeaderController.text;
                    callingAnalysisModel.evaluator = evaluator.text;
                    callingAnalysisModel.callDone = callDone;
                    callingAnalysisModel.remark = remark;
                    callingAnalysisModel.newCarModel = newCarModel.text;
                  });

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CallingAnalysis3()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
