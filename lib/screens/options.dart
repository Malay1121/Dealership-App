import 'package:dealership/constants.dart';
import 'package:dealership/screens/calling_analysis1.dart';
import 'package:dealership/screens/enquiry1.dart';
import 'package:dealership/screens/register_check.dart';
import 'package:flutter/material.dart';

class OptionScreen extends StatefulWidget {
  const OptionScreen({Key? key}) : super(key: key);

  @override
  State<OptionScreen> createState() => _OptionScreenState();
}

bool buying = true;
bool selling = false;
bool callingAnalysis = false;

class _OptionScreenState extends State<OptionScreen> {
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: _mediaQuery.width / 9.53846153846,
                right: _mediaQuery.width / 13.7777777778,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: _mediaQuery.height / 5.30718954248,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: _mediaQuery.width / 1.45766423358,
                        child: Text(
                          'Choose an option',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.66),
                            fontFamily: roboto,
                            fontSize: _mediaQuery.width / 16.1739130435,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.highlight_off,
                          color: blue,
                          size: _mediaQuery.width / 14.88,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: _mediaQuery.height / 8.0396039604,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (buying == true) {
                        setState(() {
                          buying = false;
                          selling = true;
                          callingAnalysis = false;
                        });
                      } else if (buying == false) {
                        setState(() {
                          buying = true;
                          selling = false;
                          callingAnalysis = false;
                        });
                      }
                    },
                    child: Container(
                      width: _mediaQuery.width / 1.20388349515,
                      height: _mediaQuery.height / 13.7627118644,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            width: 1,
                            color: buying == true ? blue : Color(0xFFA2A2A2)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: _mediaQuery.width / 15.5,
                          right: _mediaQuery.width / 33.8181818182,
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Buying',
                              style: TextStyle(
                                color: blue,
                                fontFamily: roboto,
                                fontSize: _mediaQuery.width / 16.1739130435,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                            buying == true
                                ? Icon(Icons.check_circle_outline)
                                : SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: _mediaQuery.height / 67.6666666667,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (selling == true) {
                        setState(() {
                          selling = false;
                          buying = true;
                          callingAnalysis = false;
                        });
                      } else if (selling == false) {
                        setState(() {
                          selling = true;
                          buying = false;
                          callingAnalysis = false;
                        });
                      }
                    },
                    child: Container(
                      width: _mediaQuery.width / 1.20388349515,
                      height: _mediaQuery.height / 13.7627118644,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            width: 1,
                            color: selling == true ? blue : Color(0xFFA2A2A2)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: _mediaQuery.width / 15.5,
                          right: _mediaQuery.width / 33.8181818182,
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Selling',
                              style: TextStyle(
                                color: blue,
                                fontFamily: roboto,
                                fontSize: _mediaQuery.width / 16.1739130435,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                            selling == true
                                ? Icon(Icons.check_circle_outline)
                                : SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: _mediaQuery.height / 67.6666666667,
                  ),
                  employee == true
                      ? GestureDetector(
                          onTap: () {
                            if (callingAnalysis == true) {
                              setState(() {
                                callingAnalysis = false;
                                buying = true;
                                selling = false;
                              });
                            } else if (callingAnalysis == false) {
                              setState(() {
                                callingAnalysis = true;
                                buying = false;
                                selling = false;
                              });
                            }
                          },
                          child: Container(
                            width: _mediaQuery.width / 1.20388349515,
                            height: _mediaQuery.height / 13.7627118644,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  width: 1,
                                  color: callingAnalysis == true
                                      ? blue
                                      : Color(0xFFA2A2A2)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: _mediaQuery.width / 15.5,
                                right: _mediaQuery.width / 33.8181818182,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    'Calling Analysis',
                                    style: TextStyle(
                                      color: blue,
                                      fontFamily: roboto,
                                      fontSize:
                                          _mediaQuery.width / 16.1739130435,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Spacer(),
                                  callingAnalysis == true
                                      ? Icon(Icons.check_circle_outline)
                                      : SizedBox(),
                                ],
                              ),
                            ),
                          ),
                        )
                      : SizedBox(),
                  employee == true
                      ? SizedBox(
                          height: _mediaQuery.height / 4.25,
                        )
                      : SizedBox(
                          height: _mediaQuery.height / 3.11324324324,
                        ),
                ],
              ),
            ),
            Button2(
              mediaQuery: _mediaQuery,
              fill: true,
              title: 'Proceed',
              nextScreen: selling == true
                  ? RegisterCheck()
                  : buying == true
                      ? Enquiry1()
                      : callingAnalysis == true
                          ? CallingAnalysis1()
                          : Container(),
            ),
          ],
        ),
      ),
    );
  }
}

class Button2 extends StatelessWidget {
  const Button2(
      {Key? key,
      required Size mediaQuery,
      required this.fill,
      required this.title,
      this.nextScreen,
      this.onTapCheck = false,
      this.onTap})
      : _mediaQuery = mediaQuery,
        super(key: key);

  final Size _mediaQuery;
  final bool fill;
  final String title;
  final nextScreen;
  final bool onTapCheck;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCheck == true
          ? onTap
          : () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => nextScreen));
              // widget.register);
            },
      child: Container(
        decoration: BoxDecoration(
          color: fill == true
              ? Color(
                  0xFF0D96FE,
                )
              : Colors.transparent,
          border: Border.all(
            width: 1,
            color: blue,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        height: _mediaQuery.height / 13.7627118644,
        width: _mediaQuery.width / 1.08771929825,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: fill == true ? Colors.white : blue,
              fontFamily: poppins,
              fontSize: _mediaQuery.width / 20.6666666667,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class BuySell extends StatefulWidget {
  const BuySell({
    required Size mediaQuery,
    required this.title,
    required this.onTap,
    required this.toggle,
  }) : _mediaQuery = mediaQuery;
  final Size _mediaQuery;
  final String title;
  final VoidCallback onTap;
  final bool toggle;

  @override
  State<BuySell> createState() => _BuySellState();
}

class _BuySellState extends State<BuySell> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: widget._mediaQuery.width / 1.20388349515,
        height: widget._mediaQuery.height / 13.7627118644,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              width: 1,
              color: widget.toggle == true ? blue : Color(0xFFA2A2A2)),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: widget._mediaQuery.width / 15.5,
            right: widget._mediaQuery.width / 33.8181818182,
          ),
          child: Row(
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  color: blue,
                  fontFamily: roboto,
                  fontSize: widget._mediaQuery.width / 16.1739130435,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              widget.toggle == true
                  ? Icon(Icons.check_circle_outline)
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
