import 'package:dealership/constants.dart';
import 'package:dealership/screens/enquiry2.dart';
import 'package:dealership/screens/evaluation2.dart';
import 'package:dealership/screens/options.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:o_popup/o_popup.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Enquiry3 extends StatefulWidget {
  const Enquiry3({Key? key}) : super(key: key);

  @override
  State<Enquiry3> createState() => _Enquiry3State();
}

TextEditingController enginenoController = TextEditingController();
TextEditingController registerationnoController = TextEditingController();
TextEditingController makeModelController = TextEditingController();
TextEditingController chassisController = TextEditingController();
var _dateOfEvaluation;

class _Enquiry3State extends State<Enquiry3> {
  @override
  Widget build(BuildContext context) {
    void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
      setState(() {
        _dateOfEvaluation = args.value.toString();
      });
      print(_dateOfEvaluation);
    }

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
                      '3 / 10',
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
                    Text(
                      'Date of Evaluation',
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
                                  _dateOfEvaluation = date.toString();
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
                                _dateOfEvaluation == null
                                    ? 'Select date'
                                    : _dateOfEvaluation,
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
                      title: 'Registration Number',
                      hint: 'Type registration number',
                      controller: registerationnoController,
                    ),
                    SizedBox(
                      height: _mediaQuery.height / 81.2,
                    ),
                    TextBox(
                      mediaQuery: _mediaQuery,
                      title: 'Make & Model',
                      hint: 'Type make & model',
                      controller: makeModelController,
                    ),
                    SizedBox(
                      height: _mediaQuery.height / 81.2,
                    ),
                    TextBox(
                      mediaQuery: _mediaQuery,
                      title: 'Chasiss Number',
                      hint: 'Type chasiss number',
                      controller: chassisController,
                    ),
                    SizedBox(
                      height: _mediaQuery.height / 81.2,
                    ),
                    TextBox(
                      mediaQuery: _mediaQuery,
                      title: 'Engine Number',
                      hint: 'Type engine number',
                      controller: enginenoController,
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
                    dateOfEvaluation = _dateOfEvaluation;
                    registerationNumber = registerationnoController.text;
                    makeAndModel = makeModelController.text;
                    chassisNumber = chassisController.text;
                    engineNumber = enginenoController.text;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Enquiry4()));
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
