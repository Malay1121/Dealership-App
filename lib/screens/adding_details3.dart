import 'package:dealership/constants.dart';
import 'package:dealership/screens/enter_otp.dart';
import 'package:dealership/screens/get_started.dart';
import 'package:dealership/screens/verification.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AddingDetails3 extends StatefulWidget {
  const AddingDetails3({Key? key}) : super(key: key);

  @override
  State<AddingDetails3> createState() => _AddingDetails3State();
}

TextEditingController panNumberController = TextEditingController();
TextEditingController aadharCardNumberController = TextEditingController();

class _AddingDetails3State extends State<AddingDetails3> {
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
                              height: _mediaQuery.height / 17.2765957447,
                            ),
                            TextFieldsStart(
                              mediaQuery: _mediaQuery,
                              text: 'Adhar Card Number',
                              controller: aadharCardNumberController,
                            ),
                            SizedBox(
                              height: _mediaQuery.height / 62.4615384615,
                            ),
                            TextFieldsStart(
                              mediaQuery: _mediaQuery,
                              text: 'Pan Number',
                              controller: panNumberController,
                            ),
                            SizedBox(
                              height: _mediaQuery.height / 42.7368421053,
                            ),
                            Button(
                              mediaQuery: _mediaQuery,
                              text: 'Confirm',
                              fillColor: Colors.white,
                              textColor: Colors.black,
                              register: true,
                              onTapCheck: true,
                              onTap: () {
                                verifyPhoneNumber(phone, context, setData);
                                setState(() {
                                  panNumber = panNumberController.text;
                                  aadharCardNumber =
                                      aadharCardNumberController.text;
                                });

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EnterOTP()));
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
          ],
        ),
      ),
    );
  }

  void setData(verifcationId) {
    setState(() {
      verificationID = verifcationId;
    });
  }
}
