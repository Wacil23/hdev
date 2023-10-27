import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class TabbedPage extends StatelessWidget {
  final TabController tabController;

  const TabbedPage({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      controller: tabController,
      physics: BouncingScrollPhysics(),
      tabs: [
        Tab(
          
          child : Container(
          decoration: const BoxDecoration(
              color: Color.fromRGBO(0, 58, 119, 1),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Text(
            'Accueil',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
          ),
        )),
        Tab(text: 'Mon solde'),
        Tab(text: 'Onglet 3'),

      ],
    );
  }
}
