import 'package:flutter/material.dart';
import 'package:note_app/screens/login.screen.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Note App",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Scaffold(
        body: LoginPage(),
      ),
    );
  }
}
