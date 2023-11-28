import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAiCvLmDsR6LANsLTAyOP5JxjgDtp-riRk",
            authDomain: "mais-habil.firebaseapp.com",
            projectId: "mais-habil",
            storageBucket: "mais-habil.appspot.com",
            messagingSenderId: "158099857180",
            appId: "1:158099857180:web:d968b4fb5bda2718dca4d9",
            measurementId: "G-KKQ333TC7G"));
  } else {
    await Firebase.initializeApp();
  }
}
