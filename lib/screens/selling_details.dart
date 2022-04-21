import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dealership/constants.dart';
import 'package:dealership/screens/employee_home.dart';
import 'package:dealership/screens/get_started.dart';
import 'package:dealership/screens/home_page.dart';
import 'package:dealership/screens/options.dart';
import 'package:dealership/screens/register_check.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pdf/widgets.dart' as pw;

String _buyerName = '';
String _buyerAddress = '';
String _buyerPanNumber = '';
String _buyerAadharCard = '';
String _buyerPhone = '';

TextEditingController _nameController = TextEditingController();
TextEditingController _addressController = TextEditingController();
TextEditingController _panNumberController = TextEditingController();
TextEditingController _aadharCardController = TextEditingController();
TextEditingController _phoneController = TextEditingController();

class SellingDetails extends StatefulWidget {
  const SellingDetails({Key? key}) : super(key: key);

  @override
  State<SellingDetails> createState() => _SellingDetailsState();
}

TextEditingController numberController = TextEditingController();

SharedPreferences _sharedPreferences = sharedPreferences;

class _SellingDetailsState extends State<SellingDetails> {
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
                    height: _mediaQuery.height / 10.30718954248,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: _mediaQuery.width / 1.45766423358,
                        child: Text(
                          'Please provide the buyer information',
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
                    height: _mediaQuery.height / 25.0396039604,
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
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: 'Full Name',
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
                    height: _mediaQuery.height / 25.0396039604,
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
                        controller: _addressController,
                        decoration: InputDecoration(
                          hintText: 'Address',
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
                    height: _mediaQuery.height / 25.0396039604,
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
                        controller: _phoneController,
                        decoration: InputDecoration(
                          hintText: 'Phone no.',
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
                    height: _mediaQuery.height / 25.0396039604,
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
                        controller: _panNumberController,
                        decoration: InputDecoration(
                          hintText: 'Pan Number',
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
                    height: _mediaQuery.height / 25.0396039604,
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
                        controller: _aadharCardController,
                        decoration: InputDecoration(
                          hintText: 'Aadhar Card Number',
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
                    height: _mediaQuery.height / 8.2307692308,
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
                  if (_aadharCardController.text == '' ||
                      _addressController.text == '' ||
                      _panNumberController.text == '' ||
                      _phoneController.text == '' ||
                      _nameController.text == '') {
                    showSnackBar(
                        context, 'Please fill all the fields to continue.');
                  } else {
                    var _sharedPreferences =
                        await SharedPreferences.getInstance();
                    var documentId;
                    print(_sharedPreferences.getString('uid'));
                    await FirebaseFirestore.instance
                        .collection('cars')
                        .where('registerationNumber', isEqualTo: registeration)
                        .get()
                        .then((value) async {
                      if (value.docChanges.isEmpty) {
                        showSnackBar(context,
                            'Wrong Registeration Number. Please try again later!');
                      } else {
                        await FirebaseFirestore.instance
                            .collection('users')
                            .where('uid', isEqualTo: value.docs[0]['seller'])
                            .get()
                            .then((buyer) {
                          setState(() {
                            _buyerAadharCard = buyer.docs[0]['aadharCardNumber']
                                .toString()
                                .toUpperCase();
                            _buyerAddress = buyer.docs[0]['location']
                                .toString()
                                .toUpperCase();
                            _buyerName = buyer.docs[0]['fullName']
                                .toString()
                                .toUpperCase();
                            _buyerPanNumber = buyer.docs[0]['panNumber']
                                .toString()
                                .toUpperCase();
                            _buyerPhone =
                                buyer.docs[0]['phone'].toString().toUpperCase();
                          });
                        });

                        pdf.addPage(pw.Page(
                            pageFormat: PdfPageFormat.a4,
                            build: (pw.Context context) {
                              return pw.Center(
                                child: pw.Text(
                                    'MOTOR VEHICLE SALE AGREEMENT\n\nTHIS AGREEMENT MADE AT :- ${value.docs[0]['dealershipName'].toString().toUpperCase()}\n\nDATE:- ${DateTime.now().toString()}\n\nBETWEEN\n\nMR. ${_nameController.text}\n\nS/0.SUNDAR LAL BHAGWANDAS GUPTA\n\nADDRESS :- ${_addressController.text}\n\nPAN NUMBER :- ${_panNumberController.text} ADDHAR CARD NUMBER ${_aadharCardController.text} MOB NO ${_phoneController.text}\n\nWHICH EXPRESSION SHALL, UNLESS IT BE REPUGNANT TO THE CONTEXT OR MEANING THEREOF, INCLUDE ‘THEIR RESPECTIVE HEIRS, EXECUTORS, ADMINISTRATORS AND ASSIGNS) OF THE ONE PART\n\nAND\n\nMR. $_buyerName\n\nS/O\n\nAddress:- $_buyerAddress\n\nPAN NUMBER:- $_buyerPanNumber ADHAR CARD NUMBER $_buyerAadharCard MOB NO $_buyerPhone\n\nHEREIN AFTER CALLED “THE BUYER” (WHICH EXPRESSION SHALL, UNLESS IT BE REPUGNANT TO THE ‘CONTEXT OR MEANING THEREOF INCLUDE HIS/HER HEIRS, EXECUTORS AND ADMINISTRATORS AND ASSIGNS) OF THE OTHER PART\n\nSELLER AND BUYER INDIVIDUALLY SHALL BE REFERRED AS PARTY AND COLLECTIVELY AS PARTIES.\n\nWHEREAS\n\nA. THE SELLER HAS THE ABSOLUTE OWNERSHIP WITH ALL RIGHTS OF OWNERSHIP AND POSSESSION WITHOUT ANY LIABILITY OF MOTOR VEHICLE REGISTRATION NUMBER ${value.docs[0]['registerationNumber'].toString().toUpperCase()} MAKE/MODEL ${value.docs[0]['makeAndModel'].toString().toUpperCase()} YEAR OF MFG ${value.docs[0]['manufactureYear'].toString().toUpperCase()} AND CHASSIS NUMBER ${value.docs[0]['chassisNumber'].toString().toUpperCase()} ENGINE NUMBER ${value.docs[0]['engineNumber'].toString().toUpperCase()} TOR VALUE CONSIDERATION AS PER MUTUAL CONSENT 8SUMG0ZE005T IN FORM OF PAYMENT BY RTGSIHNDICASH H] SELLER HAS AGREED TO SELL, CONVEY AND TRANSFERS THE VEHICLE DESCRIBED IN TO THE BUYER BY HANDING OVER ORIGINAL RC, INSURANCE, VALID PUC CERTIFICATE, ALL ORIGINAL KEYS, BANK DOCUMENTS AND ANY OTHER DOCUMENTS PERTAINING TO THE TRANSFER OF THE CAR WITH SIGNED RTO FORMS.\n\nB. THE SELLER UNDERSTANDS THAT HE TRANSFERS THE SOLE RIGHT OF OWNERSHIP OF THE MOTOR VEHICLE REFERRED IN TO THE BUYER TO BE USED AT SOLE DISCRETION OF BUYER AT HIS OR HER OWN WILL.\n\nC.THE BUYER TAKES THE FULL OWNERSHIP OF THE MOTOR VEHICLE REGISTRATION NUMBER ${value.docs[0]['registerationNumber'].toString().toUpperCase()} AND CHASSIS NUMBER ${value.docs[0]['chassisNumber'].toString().toUpperCase()} ENGINE NUMBER ${value.docs[0]['engineNumber'].toString().toUpperCase()} AND CONSENTS TO COMPLETE ALL TRANSFER FORMALITIES TO TRANSFER VEHICLE IN RTO, INSURANCE IN HIS/HER NAME ON THE EARLIEST BASIS.\n\nD.THE BUYER CONSENTS AND UNDERTAKE THAT HE HAS TAKEN THE DELIVERY'),
                              );
                            }));
                        pdf.addPage(pw.Page(
                            pageFormat: PdfPageFormat.a4,
                            build: (pw.Context context) {
                              return pw.Center(
                                child: pw.Text(
                                    'OF THE CAR AND CONSENTS ‘TO BE IN POSSESSION OF ALL MATERIAL PAPERS AND DOCUMENTS PERTAINING TO THE VEHICLE.\n\nE. BUYER UNDERTAKE AND INDEMNIFY THAT ALL THE LIABILITIES/RISKS INCLUDING BUT NOT LIMITED TO ITS MAINTENANCE, INSURANCE AND CLAIM, LIADILITY OF TAXES, STATUTORY TAXES, POLICE CHALLANS, POLICE COMPLAINTS & AFTERMATH POLICE FORMALITIES, ANY LOSS, DAMAGES AND ACCIDENTS CAUSED TO ‘THE VEHICLE AND VEHICLE MISUSE OF ANY KIND FROM THE DATE AND TIME OF POSSESSION WILL BE HIS/HER SOLE RESPONSIBILITY AND THAT SELLER SHALL NOT BE HELD LIALE WHATSOEVER\n1.BUYER\'S RESPONSIBILITY:\n\n1.1 BUYER ACKNOWLEDGES THAT THE ACQUIRED VEHICLE AND RELATED DOCUMENTS HAVE BEEN DULY INSPECTED AND APPROVED BY HIM/HER AND HAVE BEEN FOUND TO HIS/HER ENTIRE SATISFACTION.\n\n1.2. BUYER ACKNOWLEDGES THAT FROM THE INSTANT THE ACQUIRED VEHICLE IS DELIVERED BY SELLER TO BUYER. BUYER IS SOLELY RESPONSIBLE AND LIABLE FOR ANY ACCIDENTS, OFFENCES OR DISPUTES REGARDING THE ACQUIRED VEHICLE, INCLUDING, BUT NOT LIMITED TO, ILLEGAL USE OF THE VEHICLE, TRAFFIC VIOLATION NOTICES, ACCIDENT•RELATED LITIGATION, PAYMENT OF RELATED TAXES, MAINTENANCE OF VALID INSURANCE AND UPDATING THE VEHICLE RECORDS WITH RELEVANT RTO.\n\n1.3. BUYER ACKNOWLEDGES THAT UNLESS PROHIBITED BY APPLICABLE LAW, ANY INSURANCE COVERAGE, LICENSE, TAGS, PLATES OR REGISTRATION MAINTAINED BY SELLER ON THE ACQUIRED VEHICLE SHALL BE CANCELED UPON DELIVERY OF THE ACQUIRED VEHICLE TO, AND THE ACCEPTANCE OF, BY BUYER.\n\n1.4. BUYER AGREES TO SUBMIT A NOTICE OF TRANSFER OF OWNERSHIP FOR THE ACQUIRED VEHICLE TO THE CONCERNED RTO AT THE EARLIEST FROM THE DELIVERY DATE. BUYER ACKNOWLEDGES HIS/HER RESPONSIBILITY TO UPDATE OWNERSHIP DETAILS WITH THE RTO.\n\n2. REPRESENTATION AND WARRANTIES: SELLER WARRANTS THAT ALL DISCLOSURES TO BUYER AND OTHER MATTERS IN CONNECTION WITH SUCH TRANSACTION ARE IN ALL RESPECTS AS REQUIRED BY, AND IN ACCORDANCE WITH, ALL.APPLICABLE LAWS AND REGULATIONS PREVAILING AT TIME OF SIGNING THIS MOTOR VEHICLE SALE AGREEMENT WITH NO MATERIAL FACTS HIDDEN IN.\n\n3.CONTINUATION OF REPRESENTATIONS AND WARRANTIES. ALL REPRESENTATIONS AND WARRANTIES CONTAINED IN THIS AGREEMENT (IF ANY) SHALL CONTINUE IN FULL FORCE AND EFFECT AFTER EXECUTION OF THIS AGREEMENT. IFEITHER PARTY LATER LEARNS THAT A WARRANTY OR REPRESENTATION THAT IT MADE IS UNTRUE, IT IS UNDER A DUTY TO PROMPTLY DISCLOSE THIS INFORMATION TO THE OTHER PARTY IN WRITING. NO REPRESENTATION OR WARRANTY CONTAINED HEREIN SHALL BE DEEMED TO HAVE BEEN WAIVED OR IMPAIRED BY ANY INVESTIGATION MADE BY OR KNOWLEDGE OF THE OTHER PARTY TO THIS AGREEMENT.'),
                              );
                            }));
                        await saveFile();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => employee == true
                                    ? EmployeeHome()
                                    : HomePage()));
                        documentId = FirebaseFirestore.instance
                            .collection('cars')
                            .doc(value.docs[0]['uniqueId'])
                            .update({
                          'sell': true,
                          'seller': _sharedPreferences.getString('uid')
                        });
                      }
                    });
                  }
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
      if (await _requestPermission(Permission.storage)) {
        directory = await getExternalStorageDirectory();
        // String newPath = '';
        // List<String> folders = directory!.path.split('/');
        // for (int x = 1; x < folders.length; x++) {
        //   String folder = folders[x];
        //   if (folder != 'Android') {
        //     newPath += '/' + folder;
        //   } else {
        //     break;
        //   }
        // }
        // newPath = newPath + '/AgreementExports';
        // directory = Directory(newPath);
        // print(directory.path);
      } else {
        return false;
      }
    }
    if (!await directory!.exists()) {
      // await directory.create(recursive: true);
    }
    if (await directory.exists()) {
      final file = File("${directory.path}$registeration.pdf");
      await file.writeAsBytes(await pdf.save());
      showSnackBar(context, 'You can find the PDF at' + file.path);
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
