import 'package:flutter/cupertino.dart';
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
              return const Center(child: CupertinoActivityIndicator());
            }
            if (state is ActualityError) {
              return const Center(child: Icon(Icons.refresh));
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
            return SizedBox(
              height: 0,
            );
          },
        )
      ],
    );
  }
}
