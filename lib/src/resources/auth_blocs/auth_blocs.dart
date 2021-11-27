import 'dart:async';

import 'package:app/src/resources/Screen/LoginHomePage.dart';
import 'package:flutter/material.dart';
class Auth_blocs{
  StreamController _numberPhoneController = new StreamController.broadcast();
  Stream get phoneStream => _numberPhoneController.stream;
  StreamController _hoten= new StreamController.broadcast();
  Stream get nameStream => _hoten.stream;

  StreamController _cmnd= new StreamController.broadcast();
  Stream get cmndStream => _cmnd.stream;

  StreamController _address= new StreamController.broadcast();
  Stream get addressStream => _address.stream;

  StreamController _whereStart= new StreamController.broadcast();
  Stream get whereStartStream => _whereStart.stream;

  StreamController _whereEnd= new StreamController.broadcast();
  Stream get whereEndStream => _whereEnd.stream;


  bool emptyData(String hoten,String cmnd,String adrress,String noidi,String noiden,String phone) {
    // Null or empty string is invalid phone number
    if (hoten == null || hoten.isEmpty) {
      _hoten.sink.addError("Họ tên không được để trống");
      return false;
    }
    _hoten.sink.add("");
    if (cmnd == null || cmnd.isEmpty) {
      _cmnd.sink.addError("Họ tên không được để trống");
      return false;
    }
    _cmnd.sink.add("");
    if (adrress == null || adrress.isEmpty) {
      _address.sink.addError("Địa không được để trống");
      return false;
    }
    _address.sink.add("");
    if (noidi == null || noidi.isEmpty) {
      _whereStart.sink.addError("Trường này không được để trống");
      return false;
    }
    _whereStart.sink.add("");
    if (hoten == null || hoten.isEmpty) {
      _whereEnd.sink.addError("Trường này không được để trống");
      return false;
    }
    _whereEnd.sink.add("");
    if (phone == null || phone.isEmpty) {
      _numberPhoneController.sink.addError("Chưa nhập số điện thoại");
      return false;
    }
    const pattern = r'(^(?:[+0]9)?[0-9]{9,12}$)';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(phone)) {
      _numberPhoneController.sink.addError("Số điện thoại chưa đúng");
      return false;
    }
    _numberPhoneController.sink.add("");
    return true;
  }
  bool isValidPhoneNumber(String phoneNumber) {
    // Null or empty string is invalid phone number
    if (phoneNumber == null || phoneNumber.isEmpty) {
      _numberPhoneController.sink.addError("Chưa nhập số điện thoại");
      return false;
    }
    const pattern = r'(^(?:[+0]9)?[0-9]{9,12}$)';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(phoneNumber)) {
      _numberPhoneController.sink.addError("Số điện thoại chưa đúng");
      return false;
    }

    _numberPhoneController.sink.add("");
    return true;
  }

  void dispose(){
    _numberPhoneController.close();
    _hoten.close();
    _cmnd.close();
    _address.close();
    _whereStart.close();
    _whereEnd.close();
  }
}