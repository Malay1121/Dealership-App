import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:dealership/constants.dart';

class UserModel {
  String? name;
  String? phone;
  String? youAreA;
  String? department;
  String? role;
  String? salary;
  String? location;
  String? date;
  String? password;
  String? otp;
  String? uid;
  bool? employee;

  UserModel({
    this.name,
    this.phone,
    this.youAreA,
    this.department,
    this.role,
    this.salary,
    this.location,
    this.date,
    this.password,
    this.uid,
    this.employee,
  });

  factory UserModel.fromMap(map) {
    return UserModel(
      name: map['name'],
      phone: map['phone'],
      youAreA: map['youAreA'],
      department: map['department'],
      role: map['role'],
      salary: map['salary'],
      location: map['location'],
      date: map['date'],
      password: map['password'],
      uid: map['uid'],
      employee: map['employee'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'youAreA': youAreA,
      'department': department,
      'role': role,
      'salary': salary,
      'location': location,
      'date': date,
      'password': password,
      'uid': uid,
      'employee': employee,
    };
  }
}
