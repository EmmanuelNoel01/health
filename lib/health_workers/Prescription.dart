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
  final _monthController = TextEditingController();
  final _divisionController = TextEditingController();

  Future<void> submitForm() async {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Confirm Submission'),
            content: Text('Name: ${_nameController.text}\n'
                'Drug: ${_drugController.text}\n'
                'Prescription: ${_prescriptionController.text}\n'
                'Number of Days: ${_daysController.text}\n'
                'Disease: ${_diseaseController.text}\n'
                'Month: ${_monthController.text}\n'
                'Division: ${_divisionController.text}'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _submitFormData();
                },
                child: const Text('OK'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> _submitFormData() async {
    final url = 'http://192.168.30.34/apis/insert_record.php';
    final response = await http.post(
      Uri.parse(url),
      body: {
        'name': _nameController.text,
        'drug': _drugController.text,
        'prescription': _prescriptionController.text,
        'days': _daysController.text,
        'disease': _diseaseController.text,
        'month': _monthController.text,
        'division': _divisionController.text,
      },
    );

    if (response.statusCode == 200) {
      print('Form submitted successfully');
    } else {
      print('Error submitting form');
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _drugController.dispose();
    _prescriptionController.dispose();
    _daysController.dispose();
    _diseaseController.dispose();
    _monthController.dispose();
    _divisionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
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
                    height: MediaQuery.of(context).size.height / 8,
                    width: double.infinity,
                  ),
                ],
              ),
              const SizedBox(height: 50.0),
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
                            child: const Text(
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
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: const Text(
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
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: const Text(
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
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: const Text(
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
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: const Text(
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
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Month Tested:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            controller: _monthController,
                            decoration: const InputDecoration(
                              hintText: 'Enter Month Tested',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Division:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            controller: _divisionController,
                            decoration: const InputDecoration(
                              hintText: 'Enter Division For Tested Person',
                            ),
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
