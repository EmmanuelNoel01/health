import 'package:flutter/material.dart';
import 'health_workers/Prescription.dart';
import 'health_workers/bottomnav.dart';
import 'health_workers/home_doctor.dart';
import 'health_workers/report.dart';
import 'landing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Landing());
  }
}
