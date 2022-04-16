import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:dealership/constants.dart';

class CarModel {
  String? dealershipName;
  String? location;
  String? dateOfEnquiry;
  String? customerName;
  String? address;
  String? phone;
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
  String? buyingPrice;
  String? seller;
  bool? sell;
  String? uniqueId;

  CarModel(
      {this.dealershipName,
      this.location,
      this.dateOfEnquiry,
      this.customerName,
      this.address,
      this.phone,
      this.enquirySource,
      this.consultant,
      this.teamLeader,
      this.evaluator,
      this.dateOfEvaluation,
      this.registerationNumber,
      this.makeAndModel,
      this.chassisNumber,
      this.engineNumber,
      this.manufactureYear,
      this.color,
      this.kmDriven,
      this.ownerSRNumber,
      this.conditionNote,
      this.insuranceDetail,
      this.midnight,
      this.conditionOfCar,
      this.offerPrice,
      this.expectedOfferPrice,
      this.evaluationDone,
      this.interestedInExchange,
      this.exchangeDealClosed,
      this.remarkIfNo,
      this.dateOfBuying,
      this.typeOfBuying,
      this.subTypeOfBuying,
      this.reasonOfBuying,
      this.bonusFacility,
      this.bonusAmount,
      this.allDocumentsAreClear,
      this.anyHypBankName,
      this.nocAvailability,
      this.dealingType,
      this.priceIncreaseForClosing,
      this.reasonOfIncreaseAmount,
      this.buyingDetailsAsPerRC,
      this.bloodRelationAvailable,
      this.buyingDoneWithERP,
      this.buyingPrice,
      this.seller,
      this.sell,
      this.uniqueId});

  factory CarModel.fromMap(map) {
    return CarModel(
        dealershipName: map['dealershipName'],
        location: map['location'],
        dateOfEnquiry: map['dateOfEnquiry'],
        customerName: map['customerName'],
        phone: map['phone'],
        address: map['address'],
        enquirySource: map['enquirySource'],
        consultant: map['consultant'],
        teamLeader: map['teamLeader'],
        evaluator: map['evaluator'],
        dateOfEvaluation: map['dateOfEvaluation'],
        registerationNumber: map['registerationNumber'],
        makeAndModel: map['makeAndModel'],
        chassisNumber: map['chassisNumber'],
        engineNumber: map['engineNumber'],
        manufactureYear: map['manufactureYear'],
        color: map['color'],
        kmDriven: map['kmDriven'],
        ownerSRNumber: map['ownerSRNumber'],
        conditionNote: map['conditionNote'],
        insuranceDetail: map['insuranceDetail'],
        midnight: map['midnight'],
        conditionOfCar: map['conditionOfCar'],
        offerPrice: map['offerPrice'],
        expectedOfferPrice: map['expectedOfferPrice'],
        evaluationDone: map['evaluationDone'],
        interestedInExchange: map['interestedInExchange'],
        exchangeDealClosed: map['exchangeDealClosed'],
        remarkIfNo: map['remarkIfNo'],
        dateOfBuying: map['dateOfBuying'],
        typeOfBuying: map['typeOfBuying'],
        subTypeOfBuying: map['subTypeOfBuying'],
        reasonOfBuying: map['reasonOfBuying'],
        bonusFacility: map['bonusFacility'],
        bonusAmount: map['bonusAmount'],
        allDocumentsAreClear: map['allDocumentsAreClear'],
        anyHypBankName: map['anyHypBankName'],
        nocAvailability: map['nocAvailability'],
        dealingType: map['dealingType'],
        priceIncreaseForClosing: map['priceIncreaseForClosing'],
        reasonOfIncreaseAmount: map['reasonOfIncreaseAmount'],
        buyingDetailsAsPerRC: map['buyingDetailsAsPerRC'],
        bloodRelationAvailable: map['bloodRelationAvailable'],
        buyingDoneWithERP: map['buyingDoneWithERP'],
        buyingPrice: map['buyingPricex'],
        seller: map['seller'],
        sell: map['sell'],
        uniqueId: map['uniqueId']);
  }

  Map<String, dynamic> toMap() {
    return {
      'dealershipName': dealershipName,
      'location': location,
      'dateOfEnquiry': dateOfEnquiry,
      'customerName': customerName,
      'phone': phone,
      'address': address,
      'enquirySource': enquirySource,
      'consultant': consultant,
      'teamLeader': teamLeader,
      'evaluator': evaluator,
      'dateOfEvaluation': dateOfEvaluation,
      'registerationNumber': registerationNumber,
      'makeAndModel': makeAndModel,
      'chassisNumber': chassisNumber,
      'engineNumber': engineNumber,
      'manufactureYear': manufactureYear,
      'color': color,
      'kmDriven': kmDriven,
      'ownerSRNumber': ownerSRNumber,
      'conditionNote': conditionNote,
      'insuranceDetail': insuranceDetail,
      'midnight': midnight,
      'conditionOfCar': conditionOfCar,
      'offerPrice': offerPrice,
      'expectedOfferPrice': expectedOfferPrice,
      'evaluationDone': evaluationDone,
      'interestedInExchange': interestedInExchange,
      'exchangeDealClosed': exchangeDealClosed,
      'remarkIfNo': remarkIfNo,
      'dateOfBuying': dateOfBuying,
      'typeOfBuying': typeOfBuying,
      'subTypeOfBuying': subTypeOfBuying,
      'reasonOfBuying': reasonOfBuying,
      'bonusFacility': bonusFacility,
      'bonusAmount': bonusAmount,
      'allDocumentsAreClear': allDocumentsAreClear,
      'anyHypBankName': anyHypBankName,
      'nocAvailability': nocAvailability,
      'dealingType': dealingType,
      'priceIncreaseForClosing': priceIncreaseForClosing,
      'reasonOfIncreaseAmount': reasonOfIncreaseAmount,
      'buyingDetailsAsPerRC': buyingDetailsAsPerRC,
      'bloodRelationAvailable': bloodRelationAvailable,
      'buyingDoneWithERP': buyingDoneWithERP,
      'buyingPrice': buyingPrice,
      'seller': seller,
      'sell': sell,
      'uniqueId': uniqueId,
    };
  }
}
