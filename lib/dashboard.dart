import 'package:flutter/material.dart';
import 'password_manager.dart';
import 'Change_pin.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PasswordManagerPage()),
                );
              },
              child: Text('Şifre Yöneticisine Git'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChangePinPage()),
                );
              },
              child: Text('PIN Değiştir'),
            ),
          ],
        ),
      ),
    );
  }
}
