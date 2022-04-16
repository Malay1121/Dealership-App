import 'package:dealership/constants.dart';
import 'package:dealership/screens/adding_details2.dart';
import 'package:dealership/screens/get_started.dart';
import 'package:dealership/screens/verification.dart';
import 'package:flutter/material.dart';

class AddingDetails extends StatefulWidget {
  const AddingDetails({Key? key}) : super(key: key);

  @override
  State<AddingDetails> createState() => _AddingDetailsState();
}

TextEditingController departmentController = TextEditingController();
TextEditingController roleController = TextEditingController();
TextEditingController salaryController = TextEditingController();

class _AddingDetailsState extends State<AddingDetails> {
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: _mediaQuery.height,
              width: _mediaQuery.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/background.png'),
                ),
              ),
            ),
            Positioned(
              top: _mediaQuery.height / 4.43715846995,
              left: _mediaQuery.width / 12.5,
              right: _mediaQuery.width / 12.5,
              child: Container(
                height: _mediaQuery.height / 1.85812356979,
                width: _mediaQuery.width / 1.19047619048,
                decoration: BoxDecoration(
                  color: Color(
                    0xFFFBFBFB,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            color: blue,
                          ),
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.highlight_off,
                              color: blue,
                            ))
                      ],
                    ),
                    Center(
                      child: SizedBox(
                        width: _mediaQuery.width / 1.69683257919,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Adding details',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontFamily: roboto,
                                fontSize: _mediaQuery.width / 16.9090909091,
                              ),
                            ),
                            SizedBox(
                              height: _mediaQuery.height / 101.5,
                            ),
                            SizedBox(
                              width: _mediaQuery.width / 1.60944206009,
                              child: Text(
                                'Please fill the required information.',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: roboto,
                                  fontWeight: FontWeight.w400,
                                  fontSize: _mediaQuery.width / 28.8461538462,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: _mediaQuery.height / 90.2222222222,
                            ),
                            TextFieldsStart(
                              mediaQuery: _mediaQuery,
                              text: 'Department',
                              controller: departmentController,
                            ),
                            SizedBox(
                              height: _mediaQuery.height / 62.4615384615,
                            ),
                            TextFieldsStart(
                              mediaQuery: _mediaQuery,
                              text: 'Role',
                              controller: roleController,
                            ),
                            SizedBox(
                              height: _mediaQuery.height / 62.4615384615,
                            ),
                            TextFieldsStart(
                              mediaQuery: _mediaQuery,
                              text: 'Salary',
                              controller: salaryController,
                            ),
                            SizedBox(
                              height: _mediaQuery.height / 42.7368421053,
                            ),
                            Button(
                              mediaQuery: _mediaQuery,
                              text: 'Confirm',
                              fillColor: Colors.white,
                              textColor: Colors.black,
                              onTapCheck: true,
                              onTap: () {
                                setState(() {
                                  department = departmentController.text;
                                  role = roleController.text;
                                  salary = salaryController.text;
                                });

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AddingDetails2()));
                              },
                            ),
                            SizedBox(
                              height: _mediaQuery.height / 62.4615384615,
                            ),
                            SizedBox(
                              height: _mediaQuery.height / 81.2,
                            ),
                            SizedBox(
                              width: _mediaQuery.width / 1.69683257919,
                              child: Text(
                                'You can add additional cars later.',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: roboto,
                                  fontWeight: FontWeight.w400,
                                  fontSize: _mediaQuery.width / 28.8461538462,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliderPage(
              mediaQuery: _mediaQuery,
              bigColor: Color(0xFF4F4F4F),
              smallColor: Color(0xFF004D66),
            ),
          ],
        ),
      ),
    );
  }
}
