import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dealership/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

String roboto = 'Roboto';
String poppins = 'Poppins';

Color blue = Color(0xFF0177C1);

String? dealershipName;
String? carLocation;
String? dateOfEnquiry;
String? customerName;
String? address;
String? carPhone;
String? enquirySource;
String? consultant;
String? teamLeader;
String? evaluator;
String? dateOfEvaluation;
String? registerationNumber;
String? makeAndModel;
String? chassisNumber;
String? engineNumber;
String? manufactureYear;
String? color;
String? kmDriven;
String? ownerSRNumber;
String? conditionNote;
String? insuranceDetail;
String? midnight;
String? conditionOfCar;
String? offerPrice;
String? expectedOfferPrice;
String? evaluationDone;
String? interestedInExchange;
String? exchangeDealClosed;
String? remarkIfNo;
String? evaluator2;
String? dateOfBuying;
String? typeOfBuying;
String? subTypeOfBuying;
String? reasonOfBuying;
String? bonusFacility;
String? bonusAmount;
String? allDocumentsAreClear;
String? anyHypBankName;
String? nocAvailability;
String? dealingType;
String? priceIncreaseForClosing;
String? reasonOfIncreaseAmount;
String? buyingDetailsAsPerRC;
String? bloodRelationAvailable;
String? buyingDoneWithERP;
String? buyingPrice1;

var name;
var phone;
var youAreA;
var department;
var role;
var salary;
var location;
var date;
var password;
var otp;
var uid;
var aadharCardNumber;
var panNumber;

var rePassword;

var pfp;

var home;
var employeeHome;

bool employee = false;
var login = true;
void getAllData(bool logIn) {
  if (logIn == true) {
    FirebaseFirestore.instance
        .collection('users')
        .where(
          'name',
          isEqualTo: name,
        )
        .get()
        .then(
          (value) => {
            name = value.docs[0]['name'],
            phone = value.docs[0]['phone'],
          },
        );
  } else {
    FirebaseFirestore.instance
        .collection('users')
        .where(
          'uid',
          isEqualTo: FirebaseAuth.instance.currentUser!.uid,
        )
        .get()
        .then(
          (value) => {
            name = value.docs[0]['name'],
            phone = value.docs[0]['phone'],
          },
        );
  }
}
