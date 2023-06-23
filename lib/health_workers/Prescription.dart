// ignore_for_file: prefer_const_constructors, prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Prescription extends StatefulWidget {
  @override
  State<Prescription> createState() => _PrescriptionState();
}

class _PrescriptionState extends State<Prescription> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _drugController = TextEditingController();
  final _prescriptionController = TextEditingController();
  final _daysController = TextEditingController();
  final _diseaseController = TextEditingController();

  Future<void> submitForm() async {
    if (_formKey.currentState!.validate()) {
      final url = 'http://localhost:3000/api/patients';
      final response = await http.post(
        Uri.parse(url),
        body: {
          'name': _nameController.text,
          'drug': _drugController.text,
          'prescription': _prescriptionController.text,
          'days': _daysController.text,
          'disease': _diseaseController.text,
        },
      );

      if (response.statusCode == 200) {
        print('Form submitted successfully');
      } else {
        print('Error submitting form');
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _drugController.dispose();
    _prescriptionController.dispose();
    _daysController.dispose();
    _diseaseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: const Color(0xFFF5F5F3),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    color: Colors.green,
                    height: MediaQuery.of(context).size.height / 4,
                    width: double.infinity,
                  ),
                ],
              ),
              SizedBox(height: 50.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Name:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                              hintText: 'Enter name',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a name.';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Drug:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            controller: _drugController,
                            decoration: const InputDecoration(
                              hintText: 'Enter drug',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a drug.';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Prescription:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            controller: _prescriptionController,
                            decoration: const InputDecoration(
                              hintText: 'Enter prescription',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a prescription.';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Number of days:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            controller: _daysController,
                            decoration: const InputDecoration(
                              hintText: 'Enter Number of days for prescription',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter days.';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Disease:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            controller: _diseaseController,
                            decoration: const InputDecoration(
                              hintText: 'Enter the disease being treated',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter the disease.';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: submitForm,
                        child: const Text('Update'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
