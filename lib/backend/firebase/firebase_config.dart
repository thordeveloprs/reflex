import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBz1qIIAhN-Y49-P-uiHDG-xrrQ_2y71eE",
            authDomain: "neetprep-pg-pyqs-100d1.firebaseapp.com",
            projectId: "neetprep-pg-pyqs-100d1",
            storageBucket: "neetprep-pg-pyqs-100d1.appspot.com",
            messagingSenderId: "294950627480",
            appId: "1:294950627480:web:4a5bb065953c55190888ed",
            measurementId: "G-2266VTGLNB"));
  } else {
    await Firebase.initializeApp();
  }
}
