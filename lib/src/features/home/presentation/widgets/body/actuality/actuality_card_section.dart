import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hdev/src/features/home/presentation/bloc/actuality/actuality_bloc.dart';
import 'package:hdev/src/features/home/presentation/bloc/actuality/actuality_event.dart';
import 'package:hdev/src/features/home/presentation/bloc/actuality/actuality_state.dart';
import 'package:hdev/src/features/home/presentation/widgets/body/header/header_section.dart';

class ActualityCardSection extends StatelessWidget {
  final String title;

  const ActualityCardSection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final homeContractBloc = BlocProvider.of<ActualityBloc>(context);
    homeContractBloc.add(const GetActualityEvent());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderSection(
          title: title,
          dividerColor: const Color.fromRGBO(20, 76, 151, 1),
        ),
        BlocBuilder<ActualityBloc, ActualityState>(
          builder: (context, state) {
            if (state is ActualityLoading) {
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromARGB(255, 242, 242, 242)),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: const Color.fromARGB(255, 230, 230, 230)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: const Color.fromARGB(255, 225, 225, 225)),
                      ),
                    ],
                  ),
                ),
              );
            }
            if (state is ActualityError) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  state.error?.errors[0],
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }
            if (state is ActualityDone) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            state.actuality!.title!,
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        TextButton.icon(
                          onPressed: null,
                          label: const Text('Télécharger la pièce jointe'),
                          icon: const Icon(Icons.download),
                        )
                      ],
                    ),
                  ]),
                ),
              );
            }
            return const SizedBox(
              height: 0,
            );
          },
        )
      ],
    );
  }
}
