// ignore_for_file: prefer_const_constructors, prefer_const_declarations

import 'package:flutter/material.dart';

class Prescription extends StatefulWidget {
  @override
  State<Prescription> createState() => _PrescriptionState();
}

class _PrescriptionState extends State<Prescription> {
  

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
                // key: _formKey,
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
                          // controller: _nameController,
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
                          // controller: _drugController,
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
                          // controller: _prescriptionController,
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
                          // controller: _prescriptionController,
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
                          // controller: _prescriptionController,
                          decoration: const InputDecoration(
                            hintText: 'Enter the disease being treated',
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
                    ElevatedButton(
                      onPressed: () {},
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