import 'package:flutter/material.dart';
import 'package:hdev/src/features/home/presentation/widgets/app_bar/home_app_bar.dart';
import 'package:hdev/src/features/home/presentation/widgets/body/body.dart';
import 'package:hdev/src/features/home/presentation/widgets/drawer/home_drawer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomeAppBar(title: "Espace locataire", showTab: false),
      body: HomeBody(),
      drawer: HomeDrawer(),
    );
  }
}
