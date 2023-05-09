import 'package:flutter/material.dart';
import 'package:surfs_up/shared/constants/colors.dart';

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
