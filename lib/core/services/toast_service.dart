import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastService {
  static void showError(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.grey,
      textColor: Colors.black,
    );
  }
}
