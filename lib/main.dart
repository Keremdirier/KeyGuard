import 'package:flutter/material.dart';
import 'dashboard.dart'; 
import 'pin_verification.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password Manager',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PinLoginPage(),
    );
  }
}

String correctPin = '1234';  // Declare it before using it

class PinLoginPage extends StatefulWidget {
  @override
  _PinLoginPageState createState() => _PinLoginPageState();
}

class _PinLoginPageState extends State<PinLoginPage> {
  final TextEditingController _pinController = TextEditingController();

  void _validatePin() {
    if (_pinController.text == correctPin) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Yanlış PIN!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PIN Girişi')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _pinController,
              obscureText: true,
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: InputDecoration(
                labelText: 'PIN Kodu',
                border: OutlineInputBorder(),
                counterText: '',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _validatePin,
              child: Text('Giriş Yap'),
            ),
          ],
        ),
      ),
    );
  }
}
