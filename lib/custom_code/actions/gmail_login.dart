// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../auth/auth_util.dart';

Future<dynamic> gmailLogin(BuildContext context) async {
  String? accessToken;
  final _googleSignIn = GoogleSignIn();
  final signInFunc = () async {
    if (kIsWeb) {
      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithPopup(GoogleAuthProvider());
    }

    await signOutWithGoogle().catchError((_) => null);
    var auth = await (await _googleSignIn.signIn())?.authentication;
    if (auth == null) {
      print("sadsadsadsad");
      return null;
    }
    accessToken = auth.accessToken;
    print(accessToken);
    print("sdsddfsdf " + auth.accessToken.toString());
    final credential = GoogleAuthProvider.credential(
        idToken: auth.idToken, accessToken: auth.accessToken);
    return FirebaseAuth.instance.signInWithCredential(credential);
  };

  signInOrCreateAccount(context, signInFunc, 'GOOGLE');
  UserCredential? userData = await signInFunc();

  dynamic userJson = {
    "email": userData!.user!.email,
    "profile": userData.user!.photoURL,
    "name": userData.user!.displayName,
    "accessToken": userData.credential!.accessToken,
  };

  print("sdsddfsdf " + userJson["accessToken"].toString());
  print("sdsddfsdf " + userJson.toString());

  return userJson;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
