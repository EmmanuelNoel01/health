// ignore_for_file: use_key_in_widget_constructors, unused_field, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String _searchQuery = '';
  String _selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 218, 218, 213),
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          color: Color.fromARGB(255, 0, 0, 0),
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.search),
                SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'search for patient record',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Icon(Icons.filter_alt_outlined),
                SizedBox(width: 8.0),
                Text('Filter By:'),
                SizedBox(width: 8.0),
                DropdownButton<String>(
                  value: _selectedFilter,
                  onChanged: (value) {
                    setState(() {
                      _selectedFilter = value!;
                    });
                  },
                  items: <String>[
                    'All',
                    'Option 1',
                    'Option 2',
                    'Option 3'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: Center(
                child: Container(
                  // to replace this Container with the widget showing the retrieved document
                  width: 250,
                  height: 250,
                  color: Colors.blue,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Update'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('View'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


