import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hdev/core/localStorage/authentication_storage.dart';
import 'package:hdev/src/features/home/presentation/bloc/contracts_bloc.dart';
import 'package:hdev/src/features/home/presentation/bloc/contracts_event.dart';
import 'package:hdev/src/features/home/presentation/bloc/contracts_state.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final homeContractBloc = BlocProvider.of<HomeContractBloc>(context);
    homeContractBloc.add(const GetContracts());
    return BlocBuilder<HomeContractBloc, HomeContractState>(
      builder: (context, state) {
        final firstName = state.contracts?.prenomLocataire;
        final lastName = state.contracts?.nomLocataire;
        return Drawer(
          backgroundColor: const Color.fromRGBO(20, 76, 151, 1),
          elevation: 3,
          child: ListView(
            
            children: [
              DrawerHeader(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$firstName $lastName',
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.folder, color: Colors.white),
                title: const Text('Mes contrats',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w400)),
                onTap: () {
                  // Gérer l'action lorsqu'une option du Drawer est sélectionnée
                },
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton.icon(
                      style: ButtonStyle(
                          iconSize: MaterialStateProperty.all(23),
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(vertical: 13),
                          ),
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.redAccent)),
                      onPressed: () {
                        AuthBox.removeToken();
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      icon: const Icon(Icons.logout_rounded),
                      label: const Text('Déconnexion'))
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
