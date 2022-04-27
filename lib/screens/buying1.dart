import 'package:dealership/constants.dart';
import 'package:dealership/screens/buying2.dart';
import 'package:dealership/screens/get_started.dart';
import 'package:dealership/screens/options.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

class Enquiry7 extends StatefulWidget {
  const Enquiry7({Key? key}) : super(key: key);

  @override
  State<Enquiry7> createState() => _Enquiry7State();
}

String _typeOfBuying = 'Select Type';
String _subtypeOfBuying = 'Select Sub-Type';
String _reasonOfBuying = 'Select reason';
String _bonusFacility = 'Select answer';

var _dateOfBuying;

class _Enquiry7State extends State<Enquiry7> {
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
                      '7 / 10',
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
                      'Date of Buying',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontFamily: poppins,
                        fontSize: _mediaQuery.width / 23.4375,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        NAlertDialog(
                          content: SizedBox(
                            height: _mediaQuery.height / 2,
                            width: _mediaQuery.width / 1.2,
                            child: ScrollDatePicker(
                              maximumDate: DateTime(2027),
                              options: DatePickerOptions(isLoop: false),
                              onDateTimeChanged: (date) {
                                setState(() {
                                  _dateOfBuying = date.toString();
                                });
                              },
                              selectedDate: DateTime.utc(2027),
                            ),
                          ),
                        ).show(context);
                      },
                      child: Container(
                        height: _mediaQuery.height / 13.7627118644,
                        width: _mediaQuery.width / 1.21359223301,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 1, color: blue),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: _mediaQuery.width / 22.0588235294,
                            top: _mediaQuery.height / 67.6666666667,
                            right: _mediaQuery.width / 20.8333333333,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _dateOfBuying == null
                                    ? 'Select date'
                                    : _dateOfBuying,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontFamily: poppins,
                                  fontSize: _mediaQuery.width / 20.8333333333,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.calendar_month_outlined,
                                color: blue,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: _mediaQuery.height / 81.2,
                    ),
                    Row(
                      children: [
                        Text(
                          'Type of Buying',
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
                          disabledHint: Text(
                            'Select type',
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
                          value: _typeOfBuying,
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
                              _typeOfBuying = newValue!;
                            });
                          },
                          items: <String>[
                            'Select Type',
                            'Legal',
                            'In Legal',
                            'Route',
                            'Dummy',
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
                    Row(
                      children: [
                        Text(
                          'Sub-type of Buying',
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
                          value: _subtypeOfBuying,
                          iconSize: 24,
                          hint: Text(
                            'Select sub-type',
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
                              _subtypeOfBuying = newValue!;
                            });
                          },
                          items: <String>[
                            'Select Sub-Type',
                            'Exchange',
                            'Without Exchange',
                            'Route',
                            'Dummy',
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
                    Row(
                      children: [
                        Text(
                          'Reason for buying',
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
                          disabledHint: Text(
                            'Select reason',
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
                          value: _reasonOfBuying,
                          iconSize: 24,
                          hint: Text(
                            'Select reason',
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
                              _reasonOfBuying = newValue!;
                            });
                          },
                          items: <String>[
                            'Select reason',
                            'For New Car',
                            'For Target',
                            'For Profit',
                            'Order From HOD'
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
                      'Bonus Facility',
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
                            'Select answer',
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
                          value: _bonusFacility,
                          iconSize: 24,
                          hint: Text(
                            'Select answer',
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
                              _bonusFacility = newValue!;
                            });
                          },
                          items: <String>['Select answer', 'Yes', 'No']
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
                  onTap: () {
                    if (_typeOfBuying != 'Select Type') {
                      if (_subtypeOfBuying != 'Select Sub-Type') {
                        if (_reasonOfBuying != 'Select reason') {
                          dateOfBuying = _dateOfBuying;
                          typeOfBuying = _typeOfBuying;
                          subTypeOfBuying = _subtypeOfBuying;
                          reasonOfBuying = _reasonOfBuying;
                          bonusFacility = _bonusFacility;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Enquiry8()));
                        } else {
                          showSnackBar(context,
                              'Please fill required fields to continue!');
                        }
                      } else {
                        showSnackBar(context,
                            'Please fill required fields to continue!');
                      }
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
