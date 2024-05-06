import 'dart:io';

import 'package:crud_firebase/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
          apiKey: "AIzaSyCOR_Q1_E36NOTURa0dZp3x-wTcLXRCjVU",
          appId: "1:604644248396:android:8784c4ea7e1e262d2c1de9",
          messagingSenderId: "604644248396",
          projectId: "crud-operation-88979",
        ))
      : Firebase.initializeApp();
  print("firebase initialized-------------------->>>>>>>>>>>");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Home());
  }
}
