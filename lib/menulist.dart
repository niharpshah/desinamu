import 'package:flutter/material.dart';

class MenuList {
  late String buttonText;
  late String buttonNavigate;
  late MaterialColor buttonColor;

  MenuList(String bT, MaterialColor bC, String bN) {
    this.buttonText = bT;
    this.buttonColor = bC;
    this.buttonNavigate = bN;
  }
}

class dropdownList {
  late String dropdownText;

  dropdownList(String dT) {
    this.dropdownText = dT;
  }
}
