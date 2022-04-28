import 'package:dealership/constants.dart';
import 'package:dealership/screens/enquiry2.dart';
import 'package:dealership/screens/evaluation3.dart';
import 'package:dealership/screens/get_started.dart';
import 'package:dealership/screens/options.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

class Enquiry4 extends StatefulWidget {
  const Enquiry4({Key? key}) : super(key: key);

  @override
  State<Enquiry4> createState() => _Enquiry4State();
}

TextEditingController colorController = TextEditingController();
TextEditingController kmdrivenController = TextEditingController();
TextEditingController ownersrnoController = TextEditingController();
TextEditingController conditionsController = TextEditingController();
var _yearOfManufacturing;

class _Enquiry4State extends State<Enquiry4> {
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
                      '4 / 10',
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
                      'EVALUATION  Info Update'.toUpperCase(),
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
                          'Year of Manufacturing',
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
                                  _yearOfManufacturing = date.year.toString();
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
                                _yearOfManufacturing == null
                                    ? 'Select year'
                                    : _yearOfManufacturing,
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
                      title: 'Colour',
                      hint: 'Type colour',
                      controller: colorController,
                    ),
                    SizedBox(
                      height: _mediaQuery.height / 81.2,
                    ),
                    TextBox(
                      mediaQuery: _mediaQuery,
                      title: 'KM Driven',
                      hint: 'Type Killometer',
                      controller: kmdrivenController,
                    ),
                    SizedBox(
                      height: _mediaQuery.height / 81.2,
                    ),
                    TextBox(
                      mediaQuery: _mediaQuery,
                      title: 'Owner Sr no',
                      hint: 'Type owner serial number',
                      controller: ownersrnoController,
                    ),
                    SizedBox(
                      height: _mediaQuery.height / 81.2,
                    ),
                    TextBox(
                      mediaQuery: _mediaQuery,
                      title: 'Any conditions please note',
                      hint: 'Note any conditions if any',
                      controller: conditionsController,
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
                    if (_yearOfManufacturing != null) {
                      manufactureYear = _yearOfManufacturing;
                      color = colorController.text;
                      kmDriven = kmdrivenController.text;
                      ownerSRNumber = ownersrnoController.text;
                      conditionNote = conditionsController.text;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Enquiry5()));
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
