import 'package:flutter/material.dart';
import 'package:surfs_up/shared/constants/colors.dart';

/// Default snack-bar layout with a message parameter.
class DefaultSnackBar extends SnackBar {
  DefaultSnackBar({Key? key, required String message})
      : super(
          key: key,
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