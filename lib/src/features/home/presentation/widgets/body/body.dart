import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hdev/core/constants/constants.dart';
import 'package:hdev/src/features/home/data/repositories/get_actuality_repository_impl.dart';
import 'package:hdev/src/features/home/domain/usecases/get_actuality_usecase.dart';
import 'package:hdev/src/features/home/presentation/bloc/actuality/actuality_bloc.dart';
import 'package:hdev/src/features/home/presentation/bloc/actuality/actuality_state.dart';
import 'package:hdev/src/features/home/presentation/widgets/body/actuality/actuality_card_section.dart';
import 'package:hdev/src/features/home/presentation/widgets/body/contract/contract_card_section.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children:  [
          const SizedBox(height: 50),
          const CardContractSection(title: 'Mes contrats'),
          const SizedBox(height: 60),
          BlocProvider<ActualityBloc>(
            create: (context) => ActualityBloc(GetActualityUseCase(GetActualityRepositoryImpl(currentBailleurId: currentBailleurId))),
            child: const ActualityCardSection(title: 'Actualités'),
          )
        ],
      ),
    );
  }
}
