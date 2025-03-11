import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAGQkZSZyJPwvJ8wQg8gpejOgc22s_tY0E",
            authDomain: "datingtest-ec126.firebaseapp.com",
            projectId: "datingtest-ec126",
            storageBucket: "datingtest-ec126.firebasestorage.app",
            messagingSenderId: "479497004078",
            appId: "1:479497004078:web:26ae277ca2a945bbfbabbf",
            measurementId: "G-L1HJJLWHTR"));
  } else {
    await Firebase.initializeApp();
  }
}
