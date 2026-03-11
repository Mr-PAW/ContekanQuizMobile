import 'package:flutter/material.dart';
import 'movie_list_page.dart';
import '../models/movie_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controller buat nangkep input teks
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLogin() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // 1. Cek field kosong
    if (username.isEmpty || password.isEmpty) {
      _showSnackBar("Login gagal: Field tidak boleh kosong");
      return;
    }

    // 2. Cek validasi berdasarkan List<user>
    // Kita cek apakah ada "any" (salah satu) user yang username & passwordnya cocok
    bool isValid = userList.any(
      (u) => u.username == username && u.password == password,
    );

    if (isValid) {
      _showSnackBar("Login berhasil");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MovieListPage()),
      );
    } else {
      _showSnackBar("Login gagal: Username/Password salah");
    }
  }

  // Fungsi pembantu biar kode lebih rapi
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Page")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                hintText: "Username",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: _handleLogin, child: const Text("Login")),
          ],
        ),
      ),
    );
  }
}
