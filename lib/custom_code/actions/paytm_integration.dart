// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:paytm_allinonesdk/paytm_allinonesdk.dart';
import 'package:flutter/services.dart';

Future paytmIntegration(
  String orderId,
  String amount,
  String txnToken,
) async {
  print(orderId);
  print(amount);
  print(txnToken);
  String callbackurl =
      'https://securegw.paytm.in/theia/paytmCallback?ORDER_ID=$orderId';
  var response = AllInOneSdk.startTransaction(
      FFAppState().mid, orderId, amount, txnToken, callbackurl, false, false);
  response.then((value) {
    print(value);
  }).catchError((onError) {
    if (onError is PlatformException) {
      print(onError.message! + " \n  " + onError.details.toString());
    } else {
      print(onError.toString());
    }
  });
}
