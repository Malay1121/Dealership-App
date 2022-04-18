import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dealership/column_builder.dart';
import 'package:dealership/constants.dart';
import 'package:dealership/screens/employee_data.dart';
import 'package:dealership/screens/employee_home.dart';
import 'package:dealership/screens/get_started.dart';
import 'package:dealership/screens/home_page.dart';
import 'package:dealership/screens/options.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pdf/widgets.dart' as pw;

class RegisterCheck extends StatefulWidget {
  const RegisterCheck({Key? key}) : super(key: key);

  @override
  State<RegisterCheck> createState() => _RegisterCheckState();
}

TextEditingController numberController = TextEditingController();

SharedPreferences _sharedPreferences = sharedPreferences;

class _RegisterCheckState extends State<RegisterCheck> {
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  bool enabled = false;
  final pdf = pw.Document();

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
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
                          'Please enter registration number',
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
                        controller: numberController,
                        decoration: InputDecoration(
                          hintText: '0AA000A',
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
                  SizedBox(
                    height: _mediaQuery.height / 31.2307692308,
                  ),
                  SizedBox(
                    width: _mediaQuery.width / 1.21359223301,
                    height: _mediaQuery.height / 18.4545454545,
                    child: RichText(
                      text: TextSpan(
                        text: 'Vehicle available to the list, Please tap on ',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: roboto,
                          fontSize: _mediaQuery.width / 25,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: 'Proceed',
                            style: TextStyle(
                              color: blue,
                            ),
                          ),
                          TextSpan(
                            text: ' to get started.',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: _mediaQuery.height / 3.41324324324,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: _mediaQuery.width / 20,
                right: _mediaQuery.width / 20,
              ),
              child: Button2(
                mediaQuery: _mediaQuery,
                fill: true,
                title: 'Proceed',
                onTapCheck: true,
                onTap: () async {
                  var _sharedPreferences =
                      await SharedPreferences.getInstance();
                  var documentId;
                  print(numberController.text);
                  await FirebaseFirestore.instance
                      .collection('cars')
                      .where('registerationNumber',
                          isEqualTo: numberController.text)
                      .get()
                      .then((value) async {
                    if (value.docChanges.isEmpty) {
                      showSnackBar(context,
                          'Wrong Registeration Number. Please try again later!');
                    } else {
                      documentId = FirebaseFirestore.instance
                          .collection('cars')
                          .doc(value.docs[0]['uniqueId'])
                          .update({
                        'sell': true,
                        'seller': _sharedPreferences.getString('uid')
                      });
                      pdf.addPage(pw.Page(
                          pageFormat: PdfPageFormat.a4,
                          build: (pw.Context context) {
                            return pw.Center(
                              child: pw.Text(
                                  'THIS AGREEMENT MADE AT :- JATKAMOTORS PVT DTD DATE:- BRURIEORAI BETWEEN MR. RAJENDRA PRASAD GUPTA \$/0.SUNDAR LAL BHAGWANDAS GUPTA ADDRESS :- 34 SAMTA NAGAT PANI TANKI NEAR BAJAJ NAGAR NAGPUR PAN NUMBER :- AQQOC2342WWU:ADDHAR CARD NUMBER 1233507070708 NO 9822570021000) WHICH EXPRESSION SHALL, UNLESS IT BE REPUGNANT TO THE CONTEXT OR MEANING THEREOF, INCLUDE ‘THEIR RESPECTIVE HEIRS, EXECUTORS, ADMINISTRATORS AND ASSIGNS) OF THE ONE PART AND PAN NUMBER :- (2355070907) DDHAR CARD NUMBER XXSX2XXXKXXXKEMOB NO 967257002] HEREIN AFTER CALLED “THE BUYER” (WHICH EXPRESSION SHALL, UNLESS IT BE REPUGNANT TO THE ‘CONTEXT OR MEANING THEREOF INCLUDE HIS/HER HEIRS, EXECUTORS AND ADMINISTRATORS AND ASSIGNS) OF THE OTHER PART SELLER AND BUYER INDIVIDUALLY SHALL BE REFERRED AS PARTY AND COLLECTIVELY AS PARTIES. WHEREAS A. THE SELLER HAS THE ABSOLUTE OWNERSHIP WITH ALL RIGHTS OF OWNERSHIP AND POSSESSION WITHOUT ANY LIABILITY OF MOTOR VEHICLE REGISTRATION NOUMBER MHSEEABURIARE /MODEL VERNASX‘OIVGN YEAR OF MFG 2004705"AND CHASSIS NUMBER 2322922000ND ENGINE NUMBER 676766 TOR VALUE CONSIDERATION AS PER MUTUAL CONSENT 8SUMG0ZE005T IN FORM OF PAYMENT BY RTGSIHNDICASH H] SELLER HAS AGREED TO SELL, CONVEY AND TRANSFERS THE VEHICLE DESCRIBED IN TO THE BUYER BY HANDING OVER ORIGINAL RC, INSURANCE, VALID PUC CERTIFICATE, ALL ORIGINAL KEYS, BANK DOCUMENTS AND ANY OTHER DOCUMENTS PERTAINING TO THE TRANSFER OF THE CAR WITH SIGNED RTO FORMS. B. THE SELLER UNDERSTANDS THAT HE TRANSFERS THE SOLE RIGHT OF OWNERSHIP OF THE MOTOR VEHICLE REFERRED IN TO THE BUYER TO BE USED AT SOLE DISCRETION OF BUYER AT HIS OR HER OWN WILL. C.THE BUYER TAKES THE FULL OWNERSHIP OF THE MOTOR VEHICLE REGISTRATION NUMBER MHSUPA AND CHASSIS NUMBER 2§2@2299ENGINE NUMBER 23222220AND CONSENTS TO COMPLETE ALL TRANSFER FORMALITIES TO TRANSFER VEHICLE IN RTO, INSURANCE IN HIS/HER NAME ON THE EARLIEST BASIS. D.THE BUYER CONSENTS AND UNDERTAKE THAT HE HAS TAKEN THE DELIVERY OF THE CAR AND CONSENTS ‘TO BE IN POSSESSION OF ALL MATERIAL PAPERS AND DOCUMENTS PERTAINING TO THE VEHICLE. E. BUYER UNDERTAKE AND INDEMNIFY THAT ALL THE LIABILITIES/RISKS INCLUDING BUT NOT LIMITED TO ITS MAINTENANCE, INSURANCE AND CLAIM, LIADILITY OF TAXES, STATUTORY TAXES, POLICE CHALLANS, POLICE COMPLAINTS & AFTERMATH POLICE FORMALITIES, ANY LOSS, DAMAGES AND ACCIDENTS CAUSED TO ‘THE VEHICLE AND VEHICLE MISUSE OF ANY KIND FROM THE DATE AND TIME OF POSSESSION WILL BE HIS/HER SOLE RESPONSIBILITY AND THAT SELLER SHALL NOT BE HELD LIALE WHATSOEVER'),
                            );
                          }));

                      await saveFile();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => employee == true
                                  ? EmployeeHome()
                                  : HomePage()));
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> saveFile() async {
    Directory? directory;
    if (Platform.isAndroid) {
      if (await _requestPermission(Permission.storage) &&
          await _requestPermission(Permission.manageExternalStorage)) {
        directory = await getExternalStorageDirectory();
        String newPath = '';
        List<String> folders = directory!.path.split('/');
        for (int x = 1; x < folders.length; x++) {
          String folder = folders[x];
          if (folder != 'Android') {
            newPath += '/' + folder;
          } else {
            break;
          }
        }
        newPath = newPath + '/AgreementExports';
        directory = Directory(newPath);
        print(directory.path);
      } else {
        return false;
      }
    } else {
      if (await _requestPermission(Permission.photos)) {
        directory = await getTemporaryDirectory();
      } else {
        return false;
      }
    }
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }
    if (await directory.exists()) {
      final file = File("${numberController.text}.pdf");
      await file.writeAsBytes(await pdf.save());
    }
    return false;
  }

  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == permission.isGranted) {
        return true;
      } else {
        return false;
      }
    }
  }
}

class BuySell2 extends StatefulWidget {
  const BuySell2({
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
  State<BuySell2> createState() => _BuySell2State();
}

class _BuySell2State extends State<BuySell2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
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
        ),
        SizedBox(
          height: widget._mediaQuery.height / 67.6666666667,
        ),
      ],
    );
  }
}
