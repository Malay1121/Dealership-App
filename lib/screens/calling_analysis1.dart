import 'package:dealership/constants.dart';
import 'package:dealership/models/calling_analysis_model.dart';
import 'package:dealership/screens/calling_analysis2.dart';
import 'enquiry2.dart';
import 'package:dealership/screens/options.dart';
import 'package:flutter/material.dart';

CallingAnalysisModel callingAnalysisModel = CallingAnalysisModel();

class CallingAnalysis1 extends StatefulWidget {
  const CallingAnalysis1({Key? key}) : super(key: key);

  @override
  State<CallingAnalysis1> createState() => _CallingAnalysis1State();
}

String dealerName = 'Select Dealer';
String callingData = 'Select data type';

TextEditingController locationController = TextEditingController();
TextEditingController callingDepartment = TextEditingController();
TextEditingController customerName = TextEditingController();

class _CallingAnalysis1State extends State<CallingAnalysis1> {
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
                    '1 / 3',
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
                    'Dealer Name',
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
                        value: dealerName,
                        iconSize: 24,
                        hint: Text(
                          'Select dealership',
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
                            dealerName = newValue!;
                          });
                        },
                        items: <String>[
                          'Select Dealer',
                          'Kia',
                          'Jaika',
                          'Ketan',
                          'Jeep',
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
                    title: 'Location',
                    hint: 'Type location',
                    controller: locationController,
                  ),
                  SizedBox(
                    height: _mediaQuery.height / 81.2,
                  ),
                  Text(
                    'Calling Data',
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
                        value: callingData,
                        iconSize: 24,
                        hint: Text(
                          'Select data type',
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
                            callingData = newValue!;
                          });
                        },
                        items: <String>[
                          'Select data type',
                          'Walking ENQ',
                          'Retail',
                          'Booking'
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
                    title: 'Calling Department',
                    hint: 'Type calling department',
                    controller: callingDepartment,
                  ),
                  SizedBox(
                    height: _mediaQuery.height / 81.2,
                  ),
                  TextBox(
                    mediaQuery: _mediaQuery,
                    title: 'Customer Name ',
                    hint: 'Type customer name',
                    controller: customerName,
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
                  setState(() {
                    callingAnalysisModel.dealerName = dealerName;
                    callingAnalysisModel.location = locationController.text;
                    callingAnalysisModel.callingData = callingData;
                    callingAnalysisModel.callingDepartment =
                        callingDepartment.text;
                    callingAnalysisModel.customerName = customerName.text;
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CallingAnalysis2()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
