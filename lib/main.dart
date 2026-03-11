import 'package:flutter/material.dart';
import 'screen/login_page.dart'; // Import file login tadi

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App Quiz',
      theme: ThemeData(primarySwatch: Colors.blue),
      // Di sini kuncinya biar nge-lempar ke Login Page duluan
      home: const LoginPage(),
    );
  }
}
