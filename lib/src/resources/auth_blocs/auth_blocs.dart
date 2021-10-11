import 'dart:async';

import 'package:app/src/resources/Screen/LoginHomePage.dart';
import 'package:flutter/material.dart';
class Auth_blocs{
  StreamController _numberPhoneController = new StreamController();
  Stream get phoneStream => _numberPhoneController.stream;

  bool isValidPhoneNumber(String phoneNumber) {
    // Null or empty string is invalid phone number
    if (phoneNumber == null || phoneNumber.isEmpty) {
      _numberPhoneController.sink.addError("Chưa nhập số điện thoại");
      return false;
    }
    const pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(phoneNumber)) {
      _numberPhoneController.sink.addError("Số điện thoại chưa đúng");
      return false;
    }
    if(phoneNumber.length<=10){
      _numberPhoneController.sink.addError("Số điện thoại nhập chưa đúng");
      return false;
    }
    _numberPhoneController.sink.add("");
    return true;
  }

  void dispose(){
    _numberPhoneController.close();
  }
}