import 'package:flutter/material.dart';
const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Color(0xffebcb9b), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Color(0xffebcb9b), width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);
const kTextDecoration = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 20,
  fontFamily: 'Montserrat',
);