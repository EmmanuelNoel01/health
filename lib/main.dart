import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterfire_cli/flutterfire_cli.dart';
import 'package:health_api_and_mobile_application/firebase_options.dart';
import 'health_workers/Prescription.dart';
import 'health_workers/bottomnav.dart';
import 'health_workers/home_doctor.dart';
import 'health_workers/report.dart';
import 'landing.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        home: BottomNav());
  }
}
