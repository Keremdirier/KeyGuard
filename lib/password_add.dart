import 'package:flutter/material.dart';

class PasswordAddPage extends StatefulWidget {
  final Function(Map<String, String>) onPasswordAdded;

  PasswordAddPage({required this.onPasswordAdded});

  @override
  _PasswordAddPageState createState() => _PasswordAddPageState();
}

class _PasswordAddPageState extends State<PasswordAddPage> {
  final TextEditingController _websiteController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _addPassword() {
    if (_websiteController.text.isNotEmpty &&
        _usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      Map<String, String> newPassword = {
        'website': _websiteController.text,
        'username': _usernameController.text,
        'password': _passwordController.text,
      };

      widget.onPasswordAdded(newPassword);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Şifre başarıyla eklendi!')),
      );

      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lütfen tüm alanları doldurun!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Şifre Ekle')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _websiteController,
              decoration: InputDecoration(
                labelText: 'Web Sitesi',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Kullanıcı Adı',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Şifre',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addPassword,
              child: Text('Şifreyi Ekle'),
            ),
          ],
        ),
      ),
    );
  }
}
