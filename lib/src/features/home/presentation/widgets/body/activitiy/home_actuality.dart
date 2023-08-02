import 'package:flutter/material.dart';

class HomeActuality extends StatelessWidget {
  final String title;

  const HomeActuality({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}