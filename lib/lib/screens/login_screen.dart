import 'package:flutter/material.dart';
import 'admin_home_screen.dart';
import 'user_home_screen.dart';

class LoginScreen extends StatefulWidget {
  final void Function({required bool isAdmin, required String name}) onLogin;

  const LoginScreen({Key? key, required this.onLogin}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isAdmin = false;
  final TextEditingController _nameController =
      TextEditingController(text: 'Furkan');

  void _submit() {
    final name = _nameController.text.trim().isEmpty
        ? 'Misafir'
        : _nameController.text.trim();

    widget.onLogin(isAdmin: _isAdmin, name: name);

    if (_isAdmin) {
      Navigator.of(context).pushReplacementNamed(AdminHomeScreen.routeName);
    } else {
      Navigator.of(context).pushReplacementNamed(UserHomeScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KurbanTakip - Giriş'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ad Soyad',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: 'Adınızı girin',
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text('Kasap / Organizasyon musun?'),
                const SizedBox(width: 12),
                Switch(
                  value: _isAdmin,
                  onChanged: (val) {
                    setState(() {
                      _isAdmin = val;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submit,
                child: const Text('Devam et'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
