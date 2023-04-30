import 'package:flutter/material.dart';

/// Colors used in the app.
const kPrimaryColor = Color(0xFF59A52C);
const kSecondaryColor = Color.fromRGBO(19, 34, 70, 1.0);
const kDarkBlue = Color(0xFF0C1329);

/// Input decoration for text fields.
const textInputDecoration = InputDecoration(
    fillColor: kDarkBlue,
    filled: true,
    isDense: true,
    hintStyle: TextStyle(color: Colors.white60),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        borderSide: BorderSide.none),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 2.0)));
