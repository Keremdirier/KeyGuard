import 'package:flutter/material.dart';
import 'main.dart';

class PinVerificationPage extends StatefulWidget {
  @override
  _PinVerificationPageState createState() => _PinVerificationPageState();
}

class _PinVerificationPageState extends State<PinVerificationPage> {
  final TextEditingController _pinController = TextEditingController();
  bool _pinCorrect = false;

  void _verifyPin() {
    if (_pinController.text == correctPin) {
      setState(() {
        _pinCorrect = true;
      });
      Navigator.pop(context, true);
    } else {
      setState(() {
        _pinCorrect = false;
      });
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
              onPressed: _verifyPin,
              child: Text('PIN Doğrula'),
            ),
          ],
        ),
      ),
    );
  }
}
