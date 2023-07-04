import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'bottomnav.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();
  final healthIDController = TextEditingController();

  Future<void> loginUser() async {
    final url = Uri.parse('http://192.168.30.34/apis/login2.php');
    final body = jsonEncode({'healthWorkerID': healthIDController.text});

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

    final responseData = jsonDecode(response.body);

    if (responseData['success']) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomNav()),
      );
    } else {
      // Handle login failure
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Failed'),
          content: Text(responseData['message']),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/welcome.PNG",
                  height: 150,
                  width: 200,
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: healthIDController,
                  decoration: const InputDecoration(
                    labelText: "Enter Health WorkerID",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                InkWell(
                  onTap: loginUser,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        "Log in",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
