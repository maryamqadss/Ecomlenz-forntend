import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
void showTostmsg({required String message}){
  Fluttertoast.showToast(msg: message,
    toastLength: Toast.LENGTH_SHORT,
  );
}