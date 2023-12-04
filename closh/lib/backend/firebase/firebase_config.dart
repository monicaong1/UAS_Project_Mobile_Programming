import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCJPpwbPPxgJ0H1j6z6jxH4_ugjCfv7W9o",
            authDomain: "closh-c5d9c.firebaseapp.com",
            projectId: "closh-c5d9c",
            storageBucket: "closh-c5d9c.appspot.com",
            messagingSenderId: "69086550273",
            appId: "1:69086550273:web:eb2ce6f997eafaea8ca300"));
  } else {
    await Firebase.initializeApp();
  }
}
