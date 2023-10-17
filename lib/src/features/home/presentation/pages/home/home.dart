import 'package:flutter/material.dart';
import 'package:hdev/src/features/home/presentation/widgets/body/body.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeBody(),
    );
  }
}
