// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'Prescription.dart';
import 'explorer/fl_bar_chart_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeDoc extends StatefulWidget {
  @override
  State<HomeDoc> createState() => _HomeDocState();
}

class _HomeDocState extends State<HomeDoc> {
  final Uri _url = Uri.parse('http://192.168.56.1/apis/reports.php');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F3),
      body: Column(children: [
        Stack(
          children: [
            Container(
              color: Colors.green,
              height: MediaQuery.of(context).size.height / 2.5,
              width: double.infinity,
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 8 - 50,
              left: MediaQuery.of(context).size.width / 2 - 50,
              child: Container(
                width: 100,
                height: 250,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 2.5 - 50,
              left: 0,
              right: 0,
              child: const Center(
                child: Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BarChartWidget()),
                  );
                },
                child: Container(
                  width: 150,
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.all(20.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/data.PNG',
                          width: 130.0,
                          height: 100.0,
                        ),
                        const SizedBox(height: 8.0),
                        const Text(
                          'Data Explorer',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16.0),
              GestureDetector(
                onTap: () {
                  _launchUrl();
                },
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/report.PNG',
                          width: 130.0,
                          height: 100.0,
                        ),
                        const SizedBox(height: 8.0),
                        const Text(
                          'Medical Report',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Prescription()),
                  );
                },
                child: Container(
                  width: 150,
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.all(20.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/prescription.PNG',
                          width: 130.0,
                          height: 100.0,
                        ),
                        const SizedBox(height: 8.0),
                        const Text(
                          'PrescMod',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
