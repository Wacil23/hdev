import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hdev/core/constants/constants.dart';
import 'package:hdev/src/features/home/data/repositories/get_contracts_repository_impl.dart';
import 'package:hdev/src/features/home/domain/usecases/get_contracts_usecase.dart';
import 'package:hdev/src/features/home/presentation/bloc/contracts_bloc.dart';
import 'package:hdev/src/features/home/presentation/widgets/app_bar/home_app_bar.dart';
import 'package:hdev/src/features/home/presentation/widgets/body/body.dart';
import 'package:hdev/src/features/home/presentation/widgets/body/contracts/card_contract_section.dart';
import 'package:hdev/src/features/home/presentation/widgets/drawer/home_drawer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeContractBloc>(
      create: (context) {
        return HomeContractBloc(GetContractsUseCase(GetContractsRepositoryImpl(currentBailleurId: currentBailleurId)));
      },
      child: const Scaffold(appBar: HomeAppBar(), body: HomeBody(), drawer: HomeDrawer(),),
    );
  }
}
