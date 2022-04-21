import 'package:dealership/constants.dart';
import 'package:dealership/screens/evaluation1.dart';
import 'package:dealership/screens/get_started.dart';
import 'package:dealership/screens/options.dart';
import 'package:flutter/material.dart';

class Enquiry2 extends StatefulWidget {
  const Enquiry2({Key? key}) : super(key: key);

  @override
  State<Enquiry2> createState() => _Enquiry2State();
}

String _enquirySource = 'One';

TextEditingController phonenoController = TextEditingController();
TextEditingController consultantController = TextEditingController();
TextEditingController teamLeaderController = TextEditingController();
TextEditingController evaluatorController = TextEditingController();

class _Enquiry2State extends State<Enquiry2> {
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
                      '2 / 10',
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
                    TextBox(
                      mediaQuery: _mediaQuery,
                      title: 'Mobile No',
                      hint: 'Type mobile number',
                      controller: phonenoController,
                      required: true,
                    ),
                    SizedBox(
                      height: _mediaQuery.height / 81.2,
                    ),
                    Text(
                      'Enquiry Source',
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
                            'Select source',
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
                          value: _enquirySource,
                          iconSize: 24,
                          hint: Text(
                            'Select source',
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
                              _enquirySource = newValue!;
                            });
                          },
                          items: <String>[
                            'One',
                            'New Car Showroom',
                            'Workshop',
                            'Camp',
                            'jaika cars',
                            'other',
                            'reference'
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
                        title: 'Consultant',
                        hint: 'Type consultant name',
                        controller: consultantController),
                    SizedBox(
                      height: _mediaQuery.height / 81.2,
                    ),
                    TextBox(
                      mediaQuery: _mediaQuery,
                      title: 'Team Leader',
                      hint: 'Type team leader name',
                      controller: teamLeaderController,
                    ),
                    SizedBox(
                      height: _mediaQuery.height / 81.2,
                    ),
                    TextBox(
                      mediaQuery: _mediaQuery,
                      title: 'Evaluator',
                      hint: 'Type evaluator name',
                      controller: evaluatorController,
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
                    if (phonenoController.text != '') {
                      carPhone = phonenoController.text;
                      enquirySource = _enquirySource;
                      consultant = consultantController.text;
                      teamLeader = teamLeaderController.text;
                      evaluator = evaluatorController.text;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Enquiry3()));
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

class TextBox extends StatelessWidget {
  const TextBox({
    Key? key,
    required Size mediaQuery,
    required this.title,
    required this.hint,
    required this.controller,
    this.required = false,
  })  : _mediaQuery = mediaQuery,
        super(key: key);

  final Size _mediaQuery;
  final String title;
  final String hint;
  final TextEditingController controller;
  final bool required;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontFamily: poppins,
                fontSize: _mediaQuery.width / 23.4375,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            required == true
                ? Text(
                    '*Required',
                    style: TextStyle(
                      color: blue,
                      fontFamily: poppins,
                      fontSize: _mediaQuery.width / 31.2,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                : SizedBox(),
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
              top: _mediaQuery.height / 31.6666666667,
            ),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontFamily: poppins,
                  fontSize: _mediaQuery.width / 20.8333333333,
                  fontWeight: FontWeight.w500,
                ),
              ),
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontFamily: poppins,
                fontSize: _mediaQuery.width / 20.8333333333,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
