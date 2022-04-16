import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dealership/constants.dart';
import 'package:dealership/screens/employee_home.dart';
import 'package:dealership/screens/get_started.dart';
import 'package:dealership/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/car_model.dart';

class Enquiry11 extends StatefulWidget {
  const Enquiry11({Key? key}) : super(key: key);

  @override
  State<Enquiry11> createState() => _Enquiry11State();
}

TextEditingController buyingPrice = TextEditingController();

class _Enquiry11State extends State<Enquiry11> {
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
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF1773FD).withOpacity(0.27),
                    Color(0xFF00C2FF),
                  ],
                ),
              ),
            ),
            Column(
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
                        '10 / 10',
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
                    ],
                  ),
                ),
                SizedBox(
                  height: _mediaQuery.height / 34.6060606061,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: _mediaQuery.width / 12.5,
                      right: _mediaQuery.width / 12.5),
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
                                color: Colors.black.withOpacity(0.31),
                              ),
                            ),
                            Spacer(),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.highlight_off,
                                  color: Colors.black.withOpacity(0.31),
                                ))
                          ],
                        ),
                        Center(
                          child: SizedBox(
                            width: _mediaQuery.width / 1.69683257919,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: _mediaQuery.height / 20.3,
                                ),
                                Text(
                                  'Buying confirm?',
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
                                    'Please select Confirm if buying is confirmed!',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: roboto,
                                      fontWeight: FontWeight.w400,
                                      fontSize:
                                          _mediaQuery.width / 28.8461538462,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: _mediaQuery.height / 17.2765957447,
                                ),
                                Button(
                                  mediaQuery: _mediaQuery,
                                  text: 'Confirm',
                                  fillColor: Colors.white,
                                  textColor: blue,
                                  onTapCheck: true,
                                  onTap: () async {
                                    var _sharedPreferences =
                                        await SharedPreferences.getInstance();
                                    CarModel carModel = CarModel();

                                    carModel.address = address;
                                    carModel.allDocumentsAreClear =
                                        allDocumentsAreClear;
                                    carModel.anyHypBankName = anyHypBankName;
                                    carModel.bloodRelationAvailable =
                                        bloodRelationAvailable;
                                    carModel.bonusAmount = bonusAmount;
                                    carModel.bonusFacility = bonusFacility;
                                    carModel.buyingDetailsAsPerRC =
                                        buyingDetailsAsPerRC;
                                    carModel.buyingDoneWithERP =
                                        buyingDoneWithERP;
                                    carModel.buyingPrice = buyingPrice1;
                                    carModel.chassisNumber = chassisNumber;
                                    carModel.color = color;
                                    carModel.conditionNote = conditionNote;
                                    carModel.conditionOfCar = conditionOfCar;
                                    carModel.consultant = consultant;
                                    carModel.customerName = customerName;
                                    carModel.dateOfBuying = dateOfBuying;
                                    carModel.dateOfEnquiry = dateOfBuying;
                                    carModel.dateOfEvaluation =
                                        dateOfEvaluation;
                                    carModel.dealershipName = dealershipName;
                                    carModel.dealingType = dealingType;
                                    carModel.engineNumber = engineNumber;
                                    carModel.enquirySource = enquirySource;
                                    carModel.evaluationDone = evaluationDone;
                                    carModel.evaluator = evaluator;
                                    carModel.exchangeDealClosed =
                                        exchangeDealClosed;
                                    carModel.expectedOfferPrice =
                                        expectedOfferPrice;
                                    carModel.insuranceDetail = insuranceDetail;
                                    carModel.interestedInExchange =
                                        interestedInExchange;
                                    carModel.kmDriven = kmDriven;
                                    carModel.location = carLocation;
                                    carModel.makeAndModel = makeAndModel;
                                    carModel.manufactureYear = manufactureYear;
                                    carModel.midnight = midnight;
                                    carModel.nocAvailability = nocAvailability;
                                    carModel.offerPrice = offerPrice;
                                    carModel.ownerSRNumber = ownerSRNumber;
                                    carModel.phone = carPhone;
                                    carModel.priceIncreaseForClosing =
                                        priceIncreaseForClosing;
                                    carModel.reasonOfBuying = reasonOfBuying;
                                    carModel.reasonOfIncreaseAmount =
                                        reasonOfIncreaseAmount;
                                    carModel.registerationNumber =
                                        registerationNumber;
                                    carModel.remarkIfNo = remarkIfNo;
                                    carModel.subTypeOfBuying = subTypeOfBuying;
                                    carModel.teamLeader = teamLeader;
                                    carModel.typeOfBuying = typeOfBuying;
                                    carModel.seller =
                                        _sharedPreferences.getString('uid');
                                    carModel.sell = false;
                                    carModel.uniqueId =
                                        '${_sharedPreferences.getString('uid')}$registerationNumber';

                                    await FirebaseFirestore.instance
                                        .collection('cars')
                                        .doc(
                                            '${_sharedPreferences.getString('uid')}$registerationNumber')
                                        .set(carModel.toMap())
                                        .then((value) => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    employee == true
                                                        ? EmployeeHome()
                                                        : HomePage())));
                                  },
                                ),
                                SizedBox(
                                  height: _mediaQuery.height / 62.4615384615,
                                ),
                                Button(
                                  mediaQuery: _mediaQuery,
                                  text: 'Not yet',
                                  fillColor: Colors.white,
                                  textColor: blue,
                                  nextScreen: HomePage(),
                                ),
                                SizedBox(
                                  height: _mediaQuery.height / 81.2,
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
          ],
        ),
      ),
    );
  }
}
