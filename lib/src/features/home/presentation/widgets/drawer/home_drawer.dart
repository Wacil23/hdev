import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hdev/core/localStorage/authentication_storage.dart';
import 'package:hdev/src/features/home/presentation/bloc/contracts/contracts_bloc.dart';
import 'package:hdev/src/features/home/presentation/bloc/contracts/contracts_state.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key, Key? z});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeContractBloc, HomeContractState>(
        builder: (context, state) {
      final firstName = state.contracts?.prenomLocataire;
      final lastName = state.contracts?.nomLocataire;
      return Drawer(
        
        backgroundColor: Color.fromARGB(255, 18, 67, 136),
        child: Column(
          children: [
            DrawerHeader(
              padding: const EdgeInsets.only(top: 70),
              child: Text(
                '$firstName $lastName',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              
                ListTile(
                  leading: const Icon(
                        Icons.maps_home_work_rounded,
                        color: Colors.white,
                      ),
                  title: const Text("Accueil", style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),),
                  onTap: (){
                     Navigator.pushNamed(context, '/');
                  },
                ),
                ExpansionTile(
                  trailing: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
                  childrenPadding: const EdgeInsets.only(left: 30),
                  leading: const Icon(Icons.folder, color: Colors.white),
                  title: const Text(
                    'Mes contrats',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.folder_open,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Contrat n° ${state.contracts!.numContrat}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        if(state.contracts != null){
                        Navigator.of(context).pushNamed('/contrat', arguments: state.contracts);
                        }
                      },
                    ),
                  ],
                ),
                ElevatedButton.icon(
                  style: ButtonStyle(
                    iconSize: MaterialStateProperty.all(23),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 13),
                    ),
                    backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Colors.redAccent,
                    ),
                  ),
                  onPressed: () {
                    AuthBox.removeToken();
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  icon: const Icon(Icons.logout_rounded),
                  label: const Text('Déconnexion'),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
