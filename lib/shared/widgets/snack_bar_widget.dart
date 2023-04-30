import 'package:flutter/material.dart';
import 'package:surfs_up/shared/constants/colors.dart';

/// Default snack-bar layout with a message parameter.
SnackBar defaultSnackBar(String message) {
  return SnackBar(
    content: Text(
      message,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16.0,
      ),
    ),
    backgroundColor: kPrimaryColor,
  );
}
