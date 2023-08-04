import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hdev/core/constants/constants.dart';
import 'package:hdev/src/features/home/data/repositories/get_actuality_repository_impl.dart';
import 'package:hdev/src/features/home/data/repositories/get_contracts_repository_impl.dart';
import 'package:hdev/src/features/home/domain/usecases/get_actuality_usecase.dart';
import 'package:hdev/src/features/home/domain/usecases/get_contracts_usecase.dart';
import 'package:hdev/src/features/home/presentation/bloc/actuality/actuality_bloc.dart';
import 'package:hdev/src/features/home/presentation/bloc/contracts/contracts_bloc.dart';
import 'package:hdev/src/features/home/presentation/widgets/app_bar/home_app_bar.dart';
import 'package:hdev/src/features/home/presentation/widgets/body/body.dart';
import 'package:hdev/src/features/home/presentation/widgets/drawer/home_drawer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomeAppBar(title: "Espace locataire", needsPop: false,),
      body: HomeBody(),
      drawer: HomeDrawer(),
    );
  }
}
