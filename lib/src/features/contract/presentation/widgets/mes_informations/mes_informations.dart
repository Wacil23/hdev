import 'package:flutter/material.dart';
import 'package:hdev/src/features/home/presentation/widgets/header/header_section.dart';

class MesInformations extends StatelessWidget {
  const MesInformations({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: const [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            HeaderSection(
                title: 'Mes informations',),
          ],
        ),
      )
    ]);
  }
}
