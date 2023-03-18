import 'package:flutter/material.dart';
import 'package:masculine/widget/screens/cat_1/description.dart';

class LoginPage extends StatefulWidget {
  final DescribePage data;
  const LoginPage({super.key, required this.data});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
