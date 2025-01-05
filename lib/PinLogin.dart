import 'package:flutter/material.dart';
import 'dashboard.dart';

class PinLoginPage extends StatefulWidget {
  @override
  _PinLoginPageState createState() => _PinLoginPageState();
}

class _PinLoginPageState extends State<PinLoginPage> {
  final TextEditingController _pinController = TextEditingController();
  final String correctPin = '1234'; // Example correct PIN

  void _validatePin() {
    if (_pinController.text == correctPin) {
      // If PIN is correct, navigate to DashboardPage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardPage()),
      );
    } else {
      // If PIN is incorrect, show a Snackbar message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Yanlış PIN!')), // "Wrong PIN!" in Turkish
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PIN Girişi')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _pinController,
              decoration: InputDecoration(
                labelText: 'PIN',
                hintText: '4 haneli PIN girin',
                filled: true,
                fillColor: Colors.white,
                counterText: '',
              ),
              obscureText: true,
              maxLength: 4,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _validatePin, // Validate the PIN
              child: Text('Giriş Yap'),
            ),
          ],
        ),
      ),
    );
  }
}
