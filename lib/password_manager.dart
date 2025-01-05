import 'package:flutter/material.dart';
import 'password_add.dart';
import 'pin_verification.dart';

class PasswordManagerPage extends StatefulWidget {
  @override
  _PasswordManagerPageState createState() => _PasswordManagerPageState();
}

class _PasswordManagerPageState extends State<PasswordManagerPage> {
  List<Map<String, String>> _passwords = [
    {
      'website': 'YouTube',
      'username': 'user_youtube',
      'password': 'password123',
    },
    {
      'website': 'Gmail',
      'username': 'user_gmail',
      'password': 'securepassword',
    },
    {
      'website': 'Spotify',
      'username': 'user_spotify',
      'password': 'musicpassword',
    },
  ];

  void _viewPassword(int index) async {
    final isPinCorrect = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PinVerificationPage()),
    );

    if (isPinCorrect) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Şifre Detayları'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Web Sitesi: ${_passwords[index]['website']}'),
                Text('Kullanıcı Adı: ${_passwords[index]['username']}'),
                Text('Şifre: ${_passwords[index]['password']}'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Kapat'),
              ),
            ],
          );
        },
      );
    }
  }

  void _removePassword(int index) {
    setState(() {
      _passwords.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Şifre silindi!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Şifre Yöneticisi')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PasswordAddPage(onPasswordAdded: (password) {
                    setState(() {
                      _passwords.add(password);
                    });
                  })),
                );
              },
              child: Text('Şifre Ekle'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _passwords.length,
                itemBuilder: (context, index) {
                  final password = _passwords[index];
                  return Card(
                    child: ListTile(
                      title: Text(password['website'] ?? ''),
                      subtitle: Text('Kullanıcı Adı: ****'),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _removePassword(index),
                      ),
                      onTap: () => _viewPassword(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
