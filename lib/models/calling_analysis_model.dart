import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:dealership/constants.dart';

class CallingAnalysisModel {
  String? dealerName;
  String? location;
  String? callingData;
  String? callingDepartment;
  String? customerName;
  String? consultant;
  String? teamLeader;
  String? evaluator;
  String? newCarModel;
  String? callDone;
  String? uid;
  String? typeOfCustomer;
  String? evaluationDoneNotBuying;
  String? remark;
  String? otherRemarkFromEvaluator;
  String? remarkIfNo;
  String? typeOfCustomer2;
  String? evaluationDoneNotBuying2;
  String? remarkNotBuying;
  String? remarkFromEvaluator;
  String? callDone2;

  CallingAnalysisModel({
    this.callDone,
    this.callDone2,
    this.callingDepartment,
    this.callingData,
    this.consultant,
    this.customerName,
    this.location,
    this.dealerName,
    this.evaluationDoneNotBuying,
    this.evaluationDoneNotBuying2,
    this.evaluator,
    this.newCarModel,
    this.otherRemarkFromEvaluator,
    this.remark,
    this.remarkFromEvaluator,
    this.remarkIfNo,
    this.remarkNotBuying,
    this.teamLeader,
    this.typeOfCustomer,
    this.typeOfCustomer2,
    this.uid,
  });

  factory CallingAnalysisModel.fromMap(map) {
    return CallingAnalysisModel(
      callDone: map['callDone'],
      callDone2: map['callDone2'],
      callingDepartment: map['callingDepartment'],
      callingData: map['callingData'],
      consultant: map['consultant'],
      customerName: map['customerName'],
      location: map['location'],
      dealerName: map['dealerName'],
      evaluationDoneNotBuying: map['evaluationDoneNotBuying'],
      evaluationDoneNotBuying2: map['evaluationDoneNotBuying2'],
      evaluator: map['evaluator'],
      newCarModel: map['newCarModel'],
      otherRemarkFromEvaluator: map['otherRemarkFromEvaluator'],
      remarkFromEvaluator: map['remarkFromEvaluator'],
      remarkIfNo: map['remarkIfNo'],
      remarkNotBuying: map['remarkNotBuying'],
      teamLeader: map['teamLeader'],
      typeOfCustomer: map['typeOfCustomer'],
      typeOfCustomer2: map['typeOfCustomer2'],
      uid: map['uid'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'callDone': callDone,
      'callDone2': callDone2,
      'callingDepartment': callingDepartment,
      'callingData': callingData,
      'consultant': consultant,
      'customerName': customerName,
      'location': location,
      'dealerName': dealerName,
      'evaluationDoneNotBuying': evaluationDoneNotBuying,
      'evaluationDoneNotBuying2': evaluationDoneNotBuying2,
      'evaluator': evaluator,
      'newCarModel': newCarModel,
      'otherRemarkFromEvaluator': otherRemarkFromEvaluator,
      'remarkFromEvaluator': remarkFromEvaluator,
      'remarkIfNo': remarkIfNo,
      'remarkNotBuying': remarkNotBuying,
      'teamLeader': teamLeader,
      'typeOfCustomer': typeOfCustomer,
      'typeOfCustomer2': typeOfCustomer2,
      'uid': uid,
    };
  }
}
