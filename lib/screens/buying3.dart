import 'package:dealership/constants.dart';
import 'package:dealership/screens/buying4.dart';
import 'package:dealership/screens/enquiry2.dart';
import 'package:dealership/screens/options.dart';
import 'package:flutter/material.dart';

class Enquiry9 extends StatefulWidget {
  const Enquiry9({Key? key}) : super(key: key);

  @override
  State<Enquiry9> createState() => _Enquiry9State();
}

String _reasonIncreaseAmount = 'One';
String _buyDetailSameAsRC = 'One';

TextEditingController priceIncreaseForClosingController =
    TextEditingController();

class _Enquiry9State extends State<Enquiry9> {
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
                      '9 / 10',
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
                      'Buying  Info Update'.toUpperCase(),
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontFamily: poppins,
                        fontSize: _mediaQuery.width / 20.8333333333,
                      ),
                    ),
                    Text(
                      'Add Buying Details',
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
                      title: 'Price Increase for Closing',
                      hint: 'Type price increased',
                      controller: priceIncreaseForClosingController,
                    ),
                    SizedBox(
                      height: _mediaQuery.height / 81.2,
                    ),
                    Text(
                      'Reason for increase amount',
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
                          disabledHint: Text(
                            'Select option',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontFamily: poppins,
                              fontSize: _mediaQuery.width / 20.8333333333,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          iconEnabledColor: Color(0xFF06ADFE),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: blue,
                          ),
                          value: _reasonIncreaseAmount,
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
                              _reasonIncreaseAmount = newValue!;
                            });
                          },
                          items: <String>['One', 'Two', 'Free', 'Four']
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
                      'Buying details are same as per RC',
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
                          disabledHint: Text(
                            'Sub-type of Buying',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontFamily: poppins,
                              fontSize: _mediaQuery.width / 20.8333333333,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          iconEnabledColor: Color(0xFF06ADFE),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: blue,
                          ),
                          value: _buyDetailSameAsRC,
                          iconSize: 24,
                          hint: Text(
                            'Select sub-ype',
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
                              _buyDetailSameAsRC = newValue!;
                            });
                          },
                          items: <String>['One', 'Two', 'Free', 'Four']
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
                      height: _mediaQuery.height / 3.93924050633,
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
                    priceIncreaseForClosing =
                        priceIncreaseForClosingController.text;
                    reasonOfIncreaseAmount = _reasonIncreaseAmount;
                    buyingDetailsAsPerRC = _buyDetailSameAsRC;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Enquiry10()));
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
