import 'package:dealership/constants.dart';
import 'package:dealership/screens/enquiry2.dart';
import 'package:dealership/screens/options.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

class Enquiry1 extends StatefulWidget {
  const Enquiry1({Key? key}) : super(key: key);

  @override
  State<Enquiry1> createState() => _Enquiry1State();
}

String dealership = 'Select Source';

TextEditingController locationController = TextEditingController();
TextEditingController customerNameController = TextEditingController();
TextEditingController addressController = TextEditingController();
var _dateOfEnquiry;

class _Enquiry1State extends State<Enquiry1> {
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
                      '1 / 10',
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
                      'Add Enquiry',
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
                      'Dealership name',
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
                            'Select a dealership',
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
                          value: dealership,
                          iconSize: 24,
                          hint: Text(
                            'Select a dealership',
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
                              dealership = newValue!;
                            });
                          },
                          items: <String>[
                            'Select Source',
                            'ketan motors pvt ltd',
                            'jaika motors pvt ltd',
                            'jaika vanijya pvt ltd',
                            'jaika cars'
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
                      hint: 'Type Location',
                      controller: locationController,
                    ),
                    SizedBox(
                      height: _mediaQuery.height / 81.2,
                    ),
                    Text(
                      'Date of Enquiry',
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
                                  _dateOfEnquiry = date.toString();
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
                                _dateOfEnquiry == null
                                    ? 'Select a date'
                                    : _dateOfEnquiry,
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
                    TextBox(
                      mediaQuery: _mediaQuery,
                      title: 'Customer Name',
                      hint: 'Type name',
                      controller: customerNameController,
                    ),
                    SizedBox(
                      height: _mediaQuery.height / 81.2,
                    ),
                    TextBox(
                      mediaQuery: _mediaQuery,
                      title: 'Address',
                      hint: 'Type address',
                      controller: addressController,
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
                    carLocation = locationController.text;
                    customerName = customerNameController.text;
                    address = addressController.text;
                    dealershipName = dealership;
                    dateOfEnquiry = _dateOfEnquiry;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Enquiry2()));
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
