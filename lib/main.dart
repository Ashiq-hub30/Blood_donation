import 'package:blood_donation_app/DonorPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBWnhSUnuXbTmrmfVzUW52xoHWuY6XNgt4",
      authDomain: "blood-donation-428e3.firebaseapp.com",
      projectId: "blood-donation-428e3",
      messagingSenderId: "994085404449",
      appId: "1:994085404449:web:11ca5d43fc584b2c544860",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Donation App',
      theme: ThemeData(primarySwatch: Colors.red),
      home: DonorPage(),
    );
  }
}
