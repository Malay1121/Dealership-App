import 'package:dealership/constants.dart';
import 'package:dealership/screens/buying5.dart';
import 'package:dealership/screens/enquiry2.dart';
import 'package:dealership/screens/options.dart';
import 'package:flutter/material.dart';

class Enquiry10 extends StatefulWidget {
  const Enquiry10({Key? key}) : super(key: key);

  @override
  State<Enquiry10> createState() => _Enquiry10State();
}

String _bloodRelation = 'One';
String _doneWithERP = 'One';

TextEditingController buyingPriceController = TextEditingController();

class _Enquiry10State extends State<Enquiry10> {
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
                    '10 / 10',
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
                  Text(
                    'Blood relation available',
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
                        value: _bloodRelation,
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
                            _bloodRelation = newValue!;
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
                    'Buying done with ERP',
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
                        value: _doneWithERP,
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
                            _doneWithERP = newValue!;
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
                  TextBox(
                    mediaQuery: _mediaQuery,
                    title: 'Buying price',
                    hint: 'Type buying price',
                    controller: buyingPriceController,
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
                  buyingPrice1 = buyingPriceController.text;
                  bloodRelationAvailable = _bloodRelation;
                  buyingDoneWithERP = _doneWithERP;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Enquiry11()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
