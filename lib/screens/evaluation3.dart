import 'package:dealership/constants.dart';
import 'package:dealership/screens/get_started.dart';
import 'enquiry2.dart';
import 'package:dealership/screens/evaluation4.dart';
import 'package:dealership/screens/options.dart';
import 'package:flutter/material.dart';

class Enquiry5 extends StatefulWidget {
  const Enquiry5({Key? key}) : super(key: key);

  @override
  State<Enquiry5> createState() => _Enquiry5State();
}

String _insuranceDetails = 'No Insurance';
String _midnight = 'Select midnight';
String _conditionOfCar = 'Select condition';

TextEditingController offerPriceController = TextEditingController();
TextEditingController expectedOfferController = TextEditingController();

class _Enquiry5State extends State<Enquiry5> {
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
                      '5 / 10',
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
                          'Insurance Details',
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
                          value: _insuranceDetails,
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
                              _insuranceDetails = newValue!;
                            });
                          },
                          items: <String>['No Insurance', 'TP', 'COP', 'Add On']
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
                      'Midnight',
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
                          value: _midnight,
                          iconSize: 24,
                          hint: Text(
                            'Select _midnight',
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
                              _midnight = newValue!;
                            });
                          },
                          items: <String>[
                            'Select midnight',
                            'NA',
                            'Date',
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
                    Text(
                      'Condition of car',
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
                          value: _conditionOfCar,
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
                              _conditionOfCar = newValue!;
                            });
                          },
                          items: <String>[
                            'Select condition',
                            'Poor',
                            'Average',
                            'Good',
                            'Excelent',
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
                      title: 'Offer price',
                      hint: 'Type offer price',
                      controller: offerPriceController,
                    ),
                    SizedBox(
                      height: _mediaQuery.height / 81.2,
                    ),
                    TextBox(
                      mediaQuery: _mediaQuery,
                      title: 'Expected offer price',
                      hint: 'Type expected price',
                      controller: expectedOfferController,
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
                    if (_insuranceDetails != 'No Insurance') {
                      insuranceDetail = _insuranceDetails;
                      midnight = _midnight;
                      conditionOfCar = _conditionOfCar;
                      offerPrice = offerPriceController.text;
                      expectedOfferPrice = expectedOfferController.text;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Enquiry6()));
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
