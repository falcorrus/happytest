import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyD-bP3X1_DUY764kUDVJEv6IHm7iwEtmKo",
            authDomain: "happydelivery-1.firebaseapp.com",
            projectId: "happydelivery-1",
            storageBucket: "happydelivery-1.appspot.com",
            messagingSenderId: "892688541888",
            appId: "1:892688541888:web:60dddb4bb34eddb292e525",
            measurementId: "G-74PCGD50CC"));
  } else {
    await Firebase.initializeApp();
  }
}
